; micro-asm.asm — VM-resident pixel assembler (level 1)
;
; WHAT IT DOES
;   Reads ASCII text from RAM[0x1000] (the text input buffer).
;   Writes pixel bytecodes to RAM[0x000] (the canvas / program area).
;   Assembled by the Rust assembler ONCE at bootstrap; after that it runs
;   on the VM itself, closing the self-hosting loop.
;
; WHY IT WORKS
;   In this VM, opcode bytes ARE ASCII characters:
;     'A'=ADD  'B'=BRANCH  'H'=HALT  'I'=LDI  'J'=JMP  'M'=MOV
;     'N'=NOP  'P'=PSET    'R'=RET   'S'=STORE 'U'=SUB  etc.
;   Register args: '0'-'9' → r0-r9 (VM reg_idx maps 0x30-0x39 → 0-9)
;   Immediate values: write the character whose ASCII value IS the byte,
;     or use $XX to write any byte value by hex escape.
;
; SOURCE SYNTAX (extends level 0 with label support)
;   Any printable char 0x21-0x7E except ;,$,#,@,,,: → written verbatim
;   $XX       (2 hex digits) → 1-byte value, e.g. $FF → 0xFF
;   $XXXXXXXX (8 hex digits) → full u32 cell, e.g. $02010000 → 0x02010000
;   Any number of hex digits is accepted; all digits shift into one u32 cell.
;   Use 8-digit form for BRANCH condition pixels (encodes cond|r1<<16|r2<<24).
;   #name → define label "name" at current output position (emits 0 bytes)
;   @name → emit 1-cell resolved address of label "name"
;   ; → rest of line is a comment, skipped
;   space, tab, newline, comma, colon → skipped (whitespace / separators)
;   0x00 (null) → end of input
;
;   Label name chars: 0x30 ('0') through 0x7A ('z') inclusive
;   Label not found: emits 0xFF as error marker, records error at 0xBFE-0xBFF
;
; ERROR REPORTING (v2)
;   RAM[0xBFE] = source line number of first error (0 = no error)
;   RAM[0xBFF] = error code (0 = no error, 1 = unknown label)
;   These are set during pass 2. After assembly, check 0xBFE: if 0, success.
;
; EXAMPLE (counter with labels)
;   #loop
;   I 0 !     ; LDI r0, 33
;   I 1 $01   ; LDI r1, 1
;   S 1 0     ; STORE r1, r0
;   A 0 1     ; ADD r0, r1 (bug: overwrites; real usage would separate regs)
;   B $0F @loop   ; BAL always → loop (addr 0)
;
; ALGORITHM: two-pass over RAM[0x1000]
;   Pass 1: scan for #name definitions, build label table at 0xC00
;   Pass 2: emit bytecodes, resolving @name references via table
;
; MEMORY MAP
;   0x000-0x3FF  output buffer (program area)
;   0x400-0x7FF  output buffer continuation
;   0x800-0xAFF  this assembler (code)
;   0xB00-0xBFC  temporary name buffer (for label lookup)
;   0xBFC        origin address (loaded into r8 before pass 1; default 0)
;   0xBFE        error_line (source line of first error, 0 = none)
;   0xBFF        error_code (0 = none, 1 = unknown label)
;   0xC00-0xFFF  label table
;   0x1000-0xFFFF  text input buffer
;
; LABEL TABLE FORMAT at 0xC00
;   [entry]: len, c0, c1, ..., c(len-1), addr
;   len=0 terminates table
;
; REGISTER MAP
;   r0   input pointer
;   r1   output pointer (pass 2 only; output counter in pass 1)
;   r2   current character
;   r3   hex high nibble / comparison temp
;   r4   hex low nibble
;   r5   comparison threshold
;   r6   name length
;   r7   label table write/scan pointer
;   r8   pass-1 output byte counter
;   r9   temp char (table reads, name copy)
;   r10  resolved address
;   r11  table comparison pointer
;   r12  loop counter (name chars remaining)
;   r13  query name pointer (into 0xB00)
;   r14  constant 1
;   r15  constant 0
;   r16  name buffer write pointer (0xB00)
;   r17  label table base (0xC00)
;   r18  source line counter (pass 2 only, 1-indexed)

.ORG 0x800

; ── Setup ─────────────────────────────────────────────────────────────
    LDI r14, 1
    LDI r15, 0
    LDI r17, 0xC00          ; label table base (constant throughout)
    LDI r7,  0xC00          ; label table write ptr (pass 1)
    ; Origin: load from RAM[0xBFC]. Default 0 if not set.
    ; Caller can write origin to 0xBFC before running assembler.
    ; This makes addresses in the output relocatable.
    LDI r8,  0xBFC
    LOAD r8, r8              ; r8 = origin address (0 = no relocation)
    LDI r0,  0x1000         ; input ptr
    ; Initialize error reporting area
    LDI r3,  0xBFE
    STORE r3, r15           ; error_line = 0 (no error)
    LDI r3,  0xBFF
    STORE r3, r15           ; error_code = 0 (no error)

; ══════════════════════════════════════════════════════════════════════
; Pass 1 — scan source, record label definitions
; ══════════════════════════════════════════════════════════════════════
pass1:
    LOAD r2, r0
    BEQ r2, r15, p1_end          ; null → done with pass 1

    LDI r3, 59                   ; ';'
    BEQ r2, r3, p1_comment

    LDI r3, 35                   ; '#'  label definition
    BEQ r2, r3, p1_label_def

    LDI r3, 64                   ; '@'  label reference (counts 1 output byte)
    BEQ r2, r3, p1_label_ref

    LDI r3, 36                   ; '$'  hex escape (counts 1 output byte)
    BEQ r2, r3, p1_hex

    LDI r3, 44                   ; ','  separator
    BEQ r2, r3, p1_skip
    LDI r3, 58                   ; ':'  separator
    BEQ r2, r3, p1_skip
    LDI r3, 33                   ; chars < 33 are whitespace
    BLTU r2, r3, p1_skip

    ; Printable, non-special: 1 output byte
    ADD r8, r14
    ADD r0, r14
    JMP pass1

p1_skip:
    ADD r0, r14
    JMP pass1

; Pass 1: skip to end of line
p1_comment:
    ADD r0, r14
    LOAD r2, r0
    LDI r3, 10                   ; '\n'
    BEQ r2, r3, pass1
    BEQ r2, r15, p1_end
    JMP p1_comment

; Pass 1: $[hex...] → 1 output cell, skip all hex digit chars
; Accepts 2-digit ($FF) or 8-digit ($AABBCCDD) — variable length
p1_hex:
    ADD r0, r14                  ; skip '$'
p1_hex_skip:
    LOAD r2, r0
    LDI r5, 0x30
    BLTU r2, r5, p1_hex_done     ; < '0'
    LDI r5, 0x3A
    BLTU r2, r5, p1_hex_next     ; '0'-'9' → hex digit
    LDI r5, 0x41
    BLTU r2, r5, p1_hex_done     ; 0x3A-0x40 → not hex
    LDI r5, 0x47
    BLTU r2, r5, p1_hex_next     ; 'A'-'F' → hex digit
    LDI r5, 0x61
    BLTU r2, r5, p1_hex_done     ; 0x47-0x60 → not hex
    LDI r5, 0x67
    BLTU r2, r5, p1_hex_next     ; 'a'-'f' → hex digit
    JMP p1_hex_done              ; > 'f' → not hex
p1_hex_next:
    ADD r0, r14
    JMP p1_hex_skip
p1_hex_done:
    ADD r8, r14                  ; 1 output cell regardless of digit count
    JMP pass1

; Pass 1: @name → 1 output byte, skip name chars
p1_label_ref:
    ADD r0, r14                  ; skip '@'
    ADD r8, r14                  ; address byte = 1 output byte
p1_ref_name_skip:
    LOAD r2, r0
    LDI r5, 0x30
    BLTU r2, r5, pass1           ; < '0' → not a name char, back to main loop
    LDI r5, 0x7B
    BGEU r2, r5, pass1           ; > 'z' → not a name char
    ADD r0, r14
    JMP p1_ref_name_skip

; Pass 1: #name → record (name → current output position) in label table
p1_label_def:
    ADD r0, r14                  ; skip '#'
    ; collect name into temp buffer at 0xB00
    LDI r16, 0xB00
    LDI r6, 0                    ; name length = 0
p1_collect_name:
    LOAD r2, r0
    LDI r5, 0x30
    BLTU r2, r5, p1_store_label  ; end of name
    LDI r5, 0x7B
    BGEU r2, r5, p1_store_label  ; end of name
    STORE r16, r2
    ADD r16, r14
    ADD r6, r14
    ADD r0, r14
    JMP p1_collect_name

p1_store_label:
    ; Write table entry: [len, c0..c(len-1), addr]
    STORE r7, r6                 ; write name length
    ADD r7, r14
    LDI r11, 0xB00               ; r11 = name read ptr
    MOV r12, r6                  ; r12 = name char count
p1_write_name:
    BEQ r12, r15, p1_write_addr
    LOAD r9, r11
    STORE r7, r9
    ADD r11, r14
    ADD r7, r14
    SUB r12, r14
    JMP p1_write_name
p1_write_addr:
    STORE r7, r8                 ; write current output byte count as address
    ADD r7, r14
    JMP pass1                    ; continue scanning

p1_end:
    STORE r7, r15                ; write end-of-table marker (len=0)

; ══════════════════════════════════════════════════════════════════════
; Pass 2 — emit bytecodes with label resolution
; ══════════════════════════════════════════════════════════════════════
    LDI r0, 0x1000               ; reset input ptr
    LDI r1, 0                    ; output ptr = start of canvas
    LDI r18, 1                   ; source line counter (1-indexed)

pass2:
    LOAD r2, r0
    BEQ r2, r15, done

    LDI r3, 10                   ; '\n' — increment line counter
    BEQ r2, r3, p2_newline

    LDI r3, 59
    BEQ r2, r3, p2_comment

    LDI r3, 35                   ; '#' label definition — skip silently
    BEQ r2, r3, p2_skip_def

    LDI r3, 64                   ; '@' label reference — resolve and emit
    BEQ r2, r3, p2_label_ref

    LDI r3, 36                   ; '$' hex escape
    BEQ r2, r3, p2_hex

    LDI r3, 44
    BEQ r2, r3, p2_skip
    LDI r3, 58
    BEQ r2, r3, p2_skip
    LDI r3, 33
    BLTU r2, r3, p2_skip

    ; Printable, non-special: write verbatim
    STORE r1, r2
    ADD r1, r14
    ADD r0, r14
    JMP pass2

p2_skip:
    ADD r0, r14
    JMP pass2

; Pass 2: newline — increment source line counter
p2_newline:
    ADD r18, r14
    ADD r0, r14
    JMP pass2

; Pass 2: skip to end of line
p2_comment:
    ADD r0, r14
    LOAD r2, r0
    LDI r3, 10
    BEQ r2, r3, pass2
    BEQ r2, r15, done
    JMP p2_comment

; Pass 2: '#name' — skip the definition, emit nothing
p2_skip_def:
    ADD r0, r14                  ; skip '#'
p2_skip_def_name:
    LOAD r2, r0
    LDI r5, 0x30
    BLTU r2, r5, pass2
    LDI r5, 0x7B
    BGEU r2, r5, pass2
    ADD r0, r14
    JMP p2_skip_def_name

; Pass 2: $[hex...] — accumulate all consecutive hex digits into one u32 cell
; $FF → 0xFF  |  $02010000 → 0x02010000  (full 32-bit BRANCH condition)
p2_hex:
    ADD r0, r14                  ; skip '$'
    LDI r3, 0                    ; accumulator
p2_hex_loop:
    LOAD r4, r0
    ; '0'-'9'
    LDI r5, 0x30
    BLTU r4, r5, p2_hex_emit
    LDI r5, 0x3A
    BLTU r4, r5, p2_hex_dec
    ; 'A'-'F'
    LDI r5, 0x41
    BLTU r4, r5, p2_hex_emit
    LDI r5, 0x47
    BLTU r4, r5, p2_hex_upper
    ; 'a'-'f'
    LDI r5, 0x61
    BLTU r4, r5, p2_hex_emit
    LDI r5, 0x67
    BLTU r4, r5, p2_hex_lower
    JMP p2_hex_emit
p2_hex_dec:
    LDI r5, 0x30
    SUB r4, r5
    JMP p2_hex_shift
p2_hex_upper:
    LDI r5, 55                   ; 'A'(65) - 10
    SUB r4, r5
    JMP p2_hex_shift
p2_hex_lower:
    LDI r5, 87                   ; 'a'(97) - 10
    SUB r4, r5
p2_hex_shift:
    LDI r5, 4
    SHL r3, r5
    OR r3, r4
    ADD r0, r14
    JMP p2_hex_loop
p2_hex_emit:
    STORE r1, r3
    ADD r1, r14
    JMP pass2

; Pass 2: '@name' — collect name, look up in table, emit address byte
p2_label_ref:
    ADD r0, r14                  ; skip '@'
    ; collect name into 0xB00
    LDI r16, 0xB00
    LDI r6, 0                    ; name length
p2_collect_ref:
    LOAD r2, r0
    LDI r5, 0x30
    BLTU r2, r5, p2_lookup
    LDI r5, 0x7B
    BGEU r2, r5, p2_lookup
    STORE r16, r2
    ADD r16, r14
    ADD r6, r14
    ADD r0, r14
    JMP p2_collect_ref

; Scan label table for name in 0xB00 (length in r6)
p2_lookup:
    MOV r7, r17                  ; r7 = table scan ptr (start at 0xC00)

p2_next_entry:
    LOAD r9, r7                  ; r9 = entry name length
    BEQ r9, r15, p2_not_found    ; len=0 → end of table

    ; Compare lengths (fast reject): r6 (query) vs r9 (entry)
    MOV r12, r6
    SUB r12, r9                  ; r12 = r6 - r9 (wrapping; 0 iff equal)
    BEQ r12, r15, p2_maybe_match

    ; Lengths differ — skip this entry: advance past [len + name_chars + addr]
    ADD r7, r14                  ; skip length byte (r7 now at first name char)
    MOV r12, r9                  ; r12 = number of name chars to skip
p2_skip_entry:
    BEQ r12, r15, p2_skip_entry_addr
    ADD r7, r14
    SUB r12, r14
    JMP p2_skip_entry
p2_skip_entry_addr:
    ADD r7, r14                  ; skip addr byte
    JMP p2_next_entry

p2_maybe_match:
    ; Lengths match. Compare name chars byte by byte.
    ADD r7, r14                  ; skip length byte (r7 now at first name char)
    LDI r13, 0xB00               ; r13 = query name ptr
    MOV r12, r6                  ; r12 = chars remaining
p2_compare:
    BEQ r12, r15, p2_matched     ; all chars matched!
    LOAD r9,  r7                 ; entry char
    LOAD r10, r13                ; query char
    BEQ r9, r10, p2_char_ok
    ; Mismatch — skip remaining name chars (r12 of them, including current) + addr
p2_mismatch_skip:
    BEQ r12, r15, p2_mismatch_addr
    ADD r7, r14
    SUB r12, r14
    JMP p2_mismatch_skip
p2_mismatch_addr:
    ADD r7, r14                  ; skip addr byte
    JMP p2_next_entry
p2_char_ok:
    ADD r7, r14
    ADD r13, r14
    SUB r12, r14
    JMP p2_compare

p2_matched:
    ; r7 now points to the addr byte (all name chars consumed)
    LOAD r10, r7                 ; r10 = resolved address
    LDI r3, 0x80000000           ; absolute address flag
    OR r10, r3                   ; mark as absolute so VM treats it correctly
    STORE r1, r10
    ADD r1, r14
    JMP pass2

p2_not_found:
    ; Record error: line number and error code
    LDI r9,  0xBFE
    STORE r9, r18           ; error_line = current line number
    LDI r9,  0xBFF
    LDI r3,  1
    STORE r9, r3            ; error_code = 1 (unknown label)
    ; Emit 0xFF error marker
    LDI r10, 0xFF
    STORE r1, r10
    ADD r1, r14
    JMP pass2

; ── Done ─────────────────────────────────────────────────────────────
done:
    STORE r1, r15                ; write null terminator
    HALT
