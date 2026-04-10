; micro-asm.asm — VM-resident pixel assembler (level 0)
;
; WHAT IT DOES
;   Reads ASCII text from RAM[0x400] (the text input buffer).
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
; SOURCE SYNTAX
;   Any printable char 0x21-0x7E except ;,$,,,: → written verbatim
;   $XX (dollar + 2 hex digits, uppercase or decimal) → decoded byte
;   ; → rest of line is a comment, skipped
;   space, tab, newline, comma, colon → skipped (whitespace / separators)
;   0x00 (null) → end of input
;
; EXAMPLE
;   counter program in single-char syntax:
;     I 0 !     ; LDI r0, 33  ('!' = 0x21 = 33)
;     I 1 $01   ; LDI r1, 1   ($01 = hex literal 1)
;     I 2 $20   ; LDI r2, 32  ($20 = 0x20 = 32)
;     S 2 0     ; STORE r2, r0
;     A 0 1     ; ADD r0, r1
;     B $00 $09 ; BRANCH always, target = addr 9
;
; REGISTER MAP (during assembler execution)
;   r0  = input pointer  (starts at 0x400 = 1024)
;   r1  = output pointer (starts at 0x000 = 0)
;   r2  = current character
;   r3  = first operand for hex conversion
;   r4  = second operand for hex conversion
;   r5  = scratch / comparison threshold
;   r14 = constant 1  (increment)
;   r15 = constant 0  (null sentinel)

.ORG 0x800

; ── Setup ────────────────────────────────────────────────────────────
    LDI r0, 0x400   ; input ptr = 1024 (text buffer)
    LDI r1, 0       ; output ptr = 0 (canvas / program area)
    LDI r14, 1      ; constant: increment
    LDI r15, 0      ; constant: null

; ── Main loop ─────────────────────────────────────────────────────────
main:
    LOAD r2, r0             ; r2 = RAM[r0]  (read char)
    BEQ r2, r15, done       ; null → done

    LDI r3, 59              ; ';' = 0x3B
    BEQ r2, r3, comment     ; start of comment

    LDI r3, 36              ; '$' = 0x24
    BEQ r2, r3, hex         ; hex escape

    LDI r3, 44              ; ',' — skip
    BEQ r2, r3, skip
    LDI r3, 58              ; ':' — skip label colons
    BEQ r2, r3, skip
    LDI r3, 33              ; chars < 33 are whitespace
    BLTU r2, r3, skip

    ; Printable, non-special: write verbatim to output
    STORE r1, r2
    ADD r1, r14
    ADD r0, r14
    JMP main

; ── Skip one char ─────────────────────────────────────────────────────
skip:
    ADD r0, r14
    JMP main

; ── Skip to end of line ───────────────────────────────────────────────
comment:
    ADD r0, r14
    LOAD r2, r0
    LDI r3, 10              ; '\n' = 0x0A
    BEQ r2, r3, main        ; newline → back to main
    BEQ r2, r15, done       ; null → done
    JMP comment

; ── $XX hex escape ────────────────────────────────────────────────────
hex:
    ADD r0, r14             ; skip '$'

    LOAD r3, r0             ; r3 = high nibble char  ('0'-'9' or 'A'-'F')
    ADD r0, r14
    LOAD r4, r0             ; r4 = low nibble char
    ADD r0, r14

    ; Convert r3: if r3 < 58 ('9'+1) → decimal digit, else hex letter
    LDI r5, 58
    BLTU r3, r5, hi_dec
    LDI r5, 55              ; 'A'(65) - 10 = 55
    SUB r3, r5
    JMP hi_done
hi_dec:
    LDI r5, 48              ; '0' = 0x30
    SUB r3, r5
hi_done:

    ; Convert r4 the same way
    LDI r5, 58
    BLTU r4, r5, lo_dec
    LDI r5, 55
    SUB r4, r5
    JMP lo_done
lo_dec:
    LDI r5, 48
    SUB r4, r5
lo_done:

    ; Combine nibbles: r3 = (r3 << 4) | r4
    LDI r5, 4
    SHL r3, r5              ; r3 <<= r5  (SHL uses register amount)
    OR r3, r4

    STORE r1, r3
    ADD r1, r14
    JMP main

; ── Done ─────────────────────────────────────────────────────────────
done:
    STORE r1, r15           ; write null terminator to output
    HALT
