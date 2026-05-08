; DESCRIPTION: This assembly code initializes an interactive disassembler for Geometry OS that reads bytecode from RAM, uses an opcode-to-mnemonic lookup table to decode instructions, and displays them with register operands. It supports scrolling through the decoded instructions using arrow keys and shows 16 instructions at a time on the screen.

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
LDI r12, 1

; =========================================
; Init opcode mnemonic table
; Each entry is 4 u32 words (ASCII chars, padded with space)
; We store a few key opcodes for the demo
; =========================================

; opcode 0x00 = "HALT"
LDI r20, OP_TABLE
LDI r21, 0             ; offset 0
MUL r21, r12
ADD r20, r21           ; skip to entry 0
STRO r20, "HALT"

; opcode 0x01 = "NOP "
LDI r20, OP_TABLE
LDI r21, 4
MUL r21, r12
ADD r20, r21
STRO r20, "NOP "

; opcode 0x02 = "FRAM"
LDI r20, OP_TABLE
LDI r21, 8
MUL r21, r12
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
LDI r13, 0              ; Start at address 0
STORE r20, r13
LDI r20, ROW_SCROLL
LDI r13, 0
STORE r20, r13

; =========================================
; Pre-load some demo bytecode at 0x0000 area
; (A small program: LDI r12, 1; LDI r13, 0x2000; STORE r13, r12; HALT)
; We write directly into RAM at the start
; =========================================
LDI r20, 0
LDI r21, 0x10          ; LDI
STORE r20, r21
ADD r20, r12
LDI r21, 1             ; r12
STORE r20, r21
ADD r20, r12
LDI r21, 1             ; imm=1
STORE r20, r21
ADD r20, r12
LDI r21, 0x10          ; LDI
STORE r20, r21
ADD r20, r12
LDI r21, 2             ; r13
STORE r20, r21
ADD r20, r12
LDI r21, 0x2000        ; imm=0x2000
STORE r20, r21
ADD r20, r12
LDI r21, 0x12          ; STORE
STORE r20, r21
ADD r20, r12
LDI r21, 2             ; addr_reg=r13
STORE r20, r21
ADD r20, r12
LDI r21, 1             ; val_reg=r12
STORE r20, r21
ADD r20, r12
LDI r21, 0x00          ; HALT
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r0

  ; Up (38) = scroll up
  LDI r1, 38
  CMP r0, r1
  JZ r7, do_up

  ; Down (40) = scroll down
  LDI r1, 40
  CMP r0, r1
  JZ r7, do_down

  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r13, r20
  LDI r1, 0
  CMP r13, r1
  JZ r7, do_draw
  SUB r13, r12
  STORE r20, r13
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r13, r20
  ADD r13, r12
  LDI r1, 50
  CMP r13, r1
  BGE r7, do_draw
  STORE r20, r13
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r4, 0x080810
  FILL r4

  ; Title bar
  LDI r4, 0
  LDI r11, 0
  LDI r5, 256
  LDI r9, 16
  LDI r14, 0x2A2A00
  RECTF r4, r11, r5, r9, r14

  LDI r20, BUF
  STRO r20, "Disassembler"
  LDI r4, 50
  LDI r11, 3
  LDI r5, BUF
  LDI r9, 0xFFFFFF
  LDI r14, 0x2A2A00
  DRAWTEXT r4, r11, r5, r9, r14

  ; Compute start address
  LDI r20, VIEW_ADDR
  LOAD r15, r20
  LDI r20, ROW_SCROLL
  LOAD r6, r20
  LDI r1, 16
  MUL r6, r1
  ADD r15, r6

  ; Draw 14 disassembly rows
  LDI r8, 0
  LDI r10, 22

disasm_row:
  ; Read opcode at r15
  LOAD r13, r15

  ; Build line: "ADDR: MNEM  operands"
  ; First, address prefix (4 hex digits)
  LDI r21, BUF

  ; Extract 4 hex digits from address (low 16 bits)
  MOV r6, r15
  LDI r16, 12
  SHR r6, r16
  LDI r16, 0xF
  AND r6, r16
  LDI r16, 48
  ADD r6, r16
  LDI r16, 10
  CMP r6, r16
  BLT r7, hi_ok1
  ADDI r6, 7
hi_ok1:
  STORE r21, r6
  ADD r21, r12

  MOV r6, r15
  LDI r16, 8
  SHR r6, r16
  LDI r16, 0xF
  AND r6, r16
  LDI r16, 48
  ADD r6, r16
  LDI r16, 10
  CMP r6, r16
  BLT r7, hi_ok2
  ADDI r6, 7
hi_ok2:
  STORE r21, r6
  ADD r21, r12

  MOV r6, r15
  LDI r16, 4
  SHR r6, r16
  LDI r16, 0xF
  AND r6, r16
  LDI r16, 48
  ADD r6, r16
  LDI r16, 10
  CMP r6, r16
  BLT r7, hi_ok3
  ADDI r6, 7
hi_ok3:
  STORE r21, r6
  ADD r21, r12

  MOV r6, r15
  LDI r16, 0xF
  AND r6, r16
  LDI r16, 48
  ADD r6, r16
  LDI r16, 10
  CMP r6, r16
  BLT r7, hi_ok4
  ADDI r6, 7
hi_ok4:
  STORE r21, r6
  ADD r21, r12

  ; ": "
  LDI r16, 58
  STORE r21, r16
  ADD r21, r12
  LDI r16, 32
  STORE r21, r16
  ADD r21, r12

  ; Lookup opcode mnemonic from table
  ; OP_TABLE[opcode * 4] = 4 ASCII chars
  MOV r6, r13           ; r6 = opcode
  LDI r16, 4
  MUL r6, r16          ; offset in table
  LDI r16, OP_TABLE
  ADD r16, r6          ; r16 = table entry address

  ; Read 4 chars and copy to output
  LDI r25, 0
copy_mnem:
  LOAD r24, r16
  CMP r24, r12
  BLT r7, mnem_space
  STORE r21, r24
  JMP mnem_next
mnem_space:
  LDI r24, 32
  STORE r21, r24
mnem_next:
  ADD r21, r12
  ADD r16, r12
  ADD r25, r12
  LDI r24, 4
  CMP r25, r24
  BLT r7, copy_mnem

  ; Space before operands
  LDI r24, 32
  STORE r21, r24
  ADD r21, r12

  ; Show first operand (reg number or address)
  ; For simplicity, just show the raw word as hex
  ADD r15, r12
  LOAD r13, r15
  ; Show as "rN" if the opcode uses registers
  MOV r6, r13
  LDI r16, 31
  CMP r6, r16
  BGE r7, show_hex_arg
  ; Register operand: show "rN"
  LDI r16, 114         ; 'r'
  STORE r21, r16
  ADD r21, r12
  LDI r16, 48
  ADD r6, r16
  STORE r21, r6
  ADD r21, r12
  JMP arg_done

show_hex_arg:
  ; Show as hex byte
  MOV r6, r13
  LDI r16, 4
  SHR r6, r16
  LDI r16, 0xF
  AND r6, r16
  LDI r16, 48
  ADD r6, r16
  LDI r16, 10
  CMP r6, r16
  BLT r7, hx_ok1
  ADDI r6, 7
hx_ok1:
  STORE r21, r6
  ADD r21, r12

  MOV r6, r13
  LDI r16, 0xF
  AND r6, r16
  LDI r16, 48
  ADD r6, r16
  LDI r16, 10
  CMP r6, r16
  BLT r7, hx_ok2
  ADDI r6, 7
hx_ok2:
  STORE r21, r6
  ADD r21, r12

arg_done:
  ; Null terminate
  LDI r24, 0
  STORE r21, r24

  ; Draw line
  LDI r4, 4
  MOV r11, r10
  LDI r5, BUF
  LDI r9, 0xCCCCCC
  LDI r14, 0x080810
  DRAWTEXT r4, r11, r5, r9, r14

  ; Advance: each instruction is 1-6 words
  ; For simplicity, advance by 3 (most common instruction length)
  LDI r1, 2
  ADD r15, r1          ; skip past opcode + first operand

  ; Next row
  LDI r1, 14
  ADD r10, r1
  ADD r8, r12
  LDI r1, 14
  CMP r8, r1
  BLT r7, disasm_row

  ; Status bar
  LDI r4, 0
  LDI r11, 236
  LDI r5, 256
  LDI r9, 20
  LDI r14, 0x1A1A2E
  RECTF r4, r11, r5, r9, r14

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll through bytecode"
  LDI r4, 4
  LDI r11, 238
  LDI r5, BUF
  LDI r9, 0x888888
  LDI r14, 0x1A1A2E
  DRAWTEXT r4, r11, r5, r9, r14

  FRAME
  JMP main_loop
