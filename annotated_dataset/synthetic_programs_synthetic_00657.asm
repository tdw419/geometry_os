; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, draws the text "WORLD" at a position defined by register values, and then enters an infinite loop where it performs arithmetic operations on registers, shifts bits, and jumps back to the start of the loop.

; mixed program
; initialization
  LDI r2, 0x3191EB
  LDI r4, 0x2F356D
  SUB r10, r5, r8
  LDI r13, 0x058985
  LDI r13, 0x576FCB
  LDI r1, 4
  DRAWTEXT r13, r13, r1, "WORLD"
  ADD r8, r6, r3
main_0:
  ADDI r2, r11, 206
  SAR r12, r13, r1
  SHLI r24, r9, 0x7AE819
  SHLI r8, r3, 0xA23484
  SHL r3, r18, r12
  SAR r4, r16, r14
  SHLI r12, r2, 4
  FRAME
  JMP main_0
