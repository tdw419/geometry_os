; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; disasm.asm -- Interactive Disassembler for Geometry OS
;
; Phase 76: Interactive Disassembler
;
; Reads bytecode from RAM and shows decoded assembly mnemonics.
; Proves disassembler integration via opcode lookup table.
; Arrow keys to scroll, shows 16 decoded instructions at a time.
;
; Since the VM has no disassembly opcode, this program implements
; a simple opcode-to-mnemonic lookup in RAM. It reads bytecode
; words from RAM, looks up the opcode in a mnemonic table, and
; displays the decoded instruction with register operands.
;
; RAM Layout:
;   0x6000-0x60FF   String buffers
;   0x6200-0x62FF   Hex scratch
;   0x6400-0x64FF   Opcode name table (93 entries, 4 chars each)
;   0x6600          View start address
;   0x6601          Scroll offset
;   0x6602-0x6700   Mnemonic scratch
;
; The opcode table stores 4-char mnemonics as 4 u32 values.
; E.g. opcode 0x10 = "LDI " = [76, 68, 73, 32]

#define KEY_PORT  0xFFF
#define BUF       0x6000
#define HEX_BUF   0x6200
#define OP_TABLE  0x6400
#define VIEW_ADDR 0x6600
#define ROW_SCROLL 0x6601
#define MNEM_BUF  0x6602

LDI r30, 0xFD00
LDI r4, 1

; =========================================
; Init opcode mnemonic table
; Each entry is 4 u32 words (ASCII chars, padded with space)
; We store a few key opcodes for the demo
; =========================================

; opcode 0x00 = "HALT"
LDI r20, OP_TABLE
LDI r21, 0             ; offset 0
MUL r21, r4
ADD r20, r21           ; skip to entry 0
STRO r20, "HALT"

; opcode 0x01 = "NOP "
LDI r20, OP_TABLE
LDI r21, 4
MUL r21, r4
ADD r20, r21
STRO r20, "NOP "

; opcode 0x02 = "FRAM"
LDI r20, OP_TABLE
LDI r21, 8
MUL r21, r4
ADD r20, r21
STRO r20, "FRAM"

; opcode 0x10 = "LDI "
LDI r20, OP_TABLE
LDI r21, 16
LDI r22, 4
MUL r21, r22
ADD r20, r21
STRO r20, "LDI "

; opcode 0x11 = "LOAD"
LDI r20, OP_TABLE
LDI r21, 17
MUL r21, r22
ADD r20, r21
STRO r20, "LOAD"

; opcode 0x12 = "STOR"
LDI r20, OP_TABLE
LDI r21, 18
MUL r21, r22
ADD r20, r21
STRO r20, "STOR"

; opcode 0x20 = "ADD "
LDI r20, OP_TABLE
LDI r21, 32
MUL r21, r22
ADD r20, r21
STRO r20, "ADD "

; opcode 0x21 = "SUB "
LDI r20, OP_TABLE
LDI r21, 33
MUL r21, r22
ADD r20, r21
STRO r20, "SUB "

; opcode 0x22 = "MUL "
LDI r20, OP_TABLE
LDI r21, 34
MUL r21, r22
ADD r20, r21
STRO r20, "MUL "

; opcode 0x23 = "DIV "
LDI r20, OP_TABLE
LDI r21, 35
MUL r21, r22
ADD r20, r21
STRO r20, "DIV "

; opcode 0x30 = "JMP "
LDI r20, OP_TABLE
LDI r21, 48
MUL r21, r22
ADD r20, r21
STRO r20, "JMP "

; opcode 0x31 = "JZ  "
LDI r20, OP_TABLE
LDI r21, 49
MUL r21, r22
ADD r20, r21
STRO r20, "JZ  "

; opcode 0x32 = "JNZ "
LDI r20, OP_TABLE
LDI r21, 50
MUL r21, r22
ADD r20, r21
STRO r20, "JNZ "

; opcode 0x33 = "CALL"
LDI r20, OP_TABLE
LDI r21, 51
MUL r21, r22
ADD r20, r21
STRO r20, "CALL"

; opcode 0x34 = "RET "
LDI r20, OP_TABLE
LDI r21, 52
MUL r21, r22
ADD r20, r21
STRO r20, "RET "

; opcode 0x40 = "PSET"
LDI r20, OP_TABLE
LDI r21, 64
MUL r21, r22
ADD r20, r21
STRO r20, "PSET"

; opcode 0x41 = "PSTI"
LDI r20, OP_TABLE
LDI r21, 65
MUL r21, r22
ADD r20, r21
STRO r20, "PSTI"

; opcode 0x42 = "FILL"
LDI r20, OP_TABLE
LDI r21, 66
MUL r21, r22
ADD r20, r21
STRO r20, "FILL"

; opcode 0x44 = "TEXT"
LDI r20, OP_TABLE
LDI r21, 68
MUL r21, r22
ADD r20, r21
STRO r20, "TEXT"

; opcode 0x48 = "IKEY"
LDI r20, OP_TABLE
LDI r21, 72
MUL r21, r22
ADD r20, r21
STRO r20, "IKEY"

; =========================================
; Init view state
; =========================================
LDI r20, VIEW_ADDR
LDI r2, 0              ; Start at address 0
STORE r20, r2
LDI r20, ROW_SCROLL
LDI r2, 0
STORE r20, r2

; =========================================
; Pre-load some demo bytecode at 0x0000 area
; (A small program: LDI r4, 1; LDI r2, 0x2000; STORE r2, r4; HALT)
; We write directly into RAM at the start
; =========================================
LDI r20, 0
LDI r21, 0x10          ; LDI
STORE r20, r21
ADD r20, r4
LDI r21, 1             ; r4
STORE r20, r21
ADD r20, r4
LDI r21, 1             ; imm=1
STORE r20, r21
ADD r20, r4
LDI r21, 0x10          ; LDI
STORE r20, r21
ADD r20, r4
LDI r21, 2             ; r2
STORE r20, r21
ADD r20, r4
LDI r21, 0x2000        ; imm=0x2000
STORE r20, r21
ADD r20, r4
LDI r21, 0x12          ; STORE
STORE r20, r21
ADD r20, r4
LDI r21, 2             ; addr_reg=r2
STORE r20, r21
ADD r20, r4
LDI r21, 1             ; val_reg=r4
STORE r20, r21
ADD r20, r4
LDI r21, 0x00          ; HALT
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r13

  ; Up (38) = scroll up
  LDI r6, 38
  CMP r13, r6
  JZ r11, do_up

  ; Down (40) = scroll down
  LDI r6, 40
  CMP r13, r6
  JZ r11, do_down

  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r2, r20
  LDI r6, 0
  CMP r2, r6
  JZ r11, do_draw
  SUB r2, r4
  STORE r20, r2
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r2, r20
  ADD r2, r4
  LDI r6, 50
  CMP r2, r6
  BGE r11, do_draw
  STORE r20, r2
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r14, 0x080810
  FILL r14

  ; Title bar
  LDI r14, 0
  LDI r5, 0
  LDI r15, 256
  LDI r12, 16
  LDI r0, 0x2A2A00
  RECTF r14, r5, r15, r12, r0

  LDI r20, BUF
  STRO r20, "Disassembler"
  LDI r14, 50
  LDI r5, 3
  LDI r15, BUF
  LDI r12, 0xFFFFFF
  LDI r0, 0x2A2A00
  DRAWTEXT r14, r5, r15, r12, r0

  ; Compute start address
  LDI r20, VIEW_ADDR
  LOAD r9, r20
  LDI r20, ROW_SCROLL
  LOAD r10, r20
  LDI r6, 16
  MUL r10, r6
  ADD r9, r10

  ; Draw 14 disassembly rows
  LDI r3, 0
  LDI r7, 22

disasm_row:
  ; Read opcode at r9
  LOAD r2, r9

  ; Build line: "ADDR: MNEM  operands"
  ; First, address prefix (4 hex digits)
  LDI r21, BUF

  ; Extract 4 hex digits from address (low 16 bits)
  MOV r10, r9
  LDI r16, 12
  SHR r10, r16
  LDI r16, 0xF
  AND r10, r16
  LDI r16, 48
  ADD r10, r16
  LDI r16, 10
  CMP r10, r16
  BLT r11, hi_ok1
  ADDI r10, 7
hi_ok1:
  STORE r21, r10
  ADD r21, r4

  MOV r10, r9
  LDI r16, 8
  SHR r10, r16
  LDI r16, 0xF
  AND r10, r16
  LDI r16, 48
  ADD r10, r16
  LDI r16, 10
  CMP r10, r16
  BLT r11, hi_ok2
  ADDI r10, 7
hi_ok2:
  STORE r21, r10
  ADD r21, r4

  MOV r10, r9
  LDI r16, 4
  SHR r10, r16
  LDI r16, 0xF
  AND r10, r16
  LDI r16, 48
  ADD r10, r16
  LDI r16, 10
  CMP r10, r16
  BLT r11, hi_ok3
  ADDI r10, 7
hi_ok3:
  STORE r21, r10
  ADD r21, r4

  MOV r10, r9
  LDI r16, 0xF
  AND r10, r16
  LDI r16, 48
  ADD r10, r16
  LDI r16, 10
  CMP r10, r16
  BLT r11, hi_ok4
  ADDI r10, 7
hi_ok4:
  STORE r21, r10
  ADD r21, r4

  ; ": "
  LDI r16, 58
  STORE r21, r16
  ADD r21, r4
  LDI r16, 32
  STORE r21, r16
  ADD r21, r4

  ; Lookup opcode mnemonic from table
  ; OP_TABLE[opcode * 4] = 4 ASCII chars
  MOV r10, r2           ; r10 = opcode
  LDI r16, 4
  MUL r10, r16          ; offset in table
  LDI r16, OP_TABLE
  ADD r16, r10          ; r16 = table entry address

  ; Read 4 chars and copy to output
  LDI r25, 0
copy_mnem:
  LOAD r24, r16
  CMP r24, r4
  BLT r11, mnem_space
  STORE r21, r24
  JMP mnem_next
mnem_space:
  LDI r24, 32
  STORE r21, r24
mnem_next:
  ADD r21, r4
  ADD r16, r4
  ADD r25, r4
  LDI r24, 4
  CMP r25, r24
  BLT r11, copy_mnem

  ; Space before operands
  LDI r24, 32
  STORE r21, r24
  ADD r21, r4

  ; Show first operand (reg number or address)
  ; For simplicity, just show the raw word as hex
  ADD r9, r4
  LOAD r2, r9
  ; Show as "rN" if the opcode uses registers
  MOV r10, r2
  LDI r16, 31
  CMP r10, r16
  BGE r11, show_hex_arg
  ; Register operand: show "rN"
  LDI r16, 114         ; 'r'
  STORE r21, r16
  ADD r21, r4
  LDI r16, 48
  ADD r10, r16
  STORE r21, r10
  ADD r21, r4
  JMP arg_done

show_hex_arg:
  ; Show as hex byte
  MOV r10, r2
  LDI r16, 4
  SHR r10, r16
  LDI r16, 0xF
  AND r10, r16
  LDI r16, 48
  ADD r10, r16
  LDI r16, 10
  CMP r10, r16
  BLT r11, hx_ok1
  ADDI r10, 7
hx_ok1:
  STORE r21, r10
  ADD r21, r4

  MOV r10, r2
  LDI r16, 0xF
  AND r10, r16
  LDI r16, 48
  ADD r10, r16
  LDI r16, 10
  CMP r10, r16
  BLT r11, hx_ok2
  ADDI r10, 7
hx_ok2:
  STORE r21, r10
  ADD r21, r4

arg_done:
  ; Null terminate
  LDI r24, 0
  STORE r21, r24

  ; Draw line
  LDI r14, 4
  MOV r5, r7
  LDI r15, BUF
  LDI r12, 0xCCCCCC
  LDI r0, 0x080810
  DRAWTEXT r14, r5, r15, r12, r0

  ; Advance: each instruction is 1-6 words
  ; For simplicity, advance by 3 (most common instruction length)
  LDI r6, 2
  ADD r9, r6          ; skip past opcode + first operand

  ; Next row
  LDI r6, 14
  ADD r7, r6
  ADD r3, r4
  LDI r6, 14
  CMP r3, r6
  BLT r11, disasm_row

  ; Status bar
  LDI r14, 0
  LDI r5, 236
  LDI r15, 256
  LDI r12, 20
  LDI r0, 0x1A1A2E
  RECTF r14, r5, r15, r12, r0

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll through bytecode"
  LDI r14, 4
  LDI r5, 238
  LDI r15, BUF
  LDI r12, 0x888888
  LDI r0, 0x1A1A2E
  DRAWTEXT r14, r5, r15, r12, r0

  FRAME
  JMP main_loop
