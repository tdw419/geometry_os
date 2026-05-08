; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a drawing loop. The loop continuously shifts bits in registers, performs arithmetic operations, checks for key input, and conditionally executes drawing commands based on the input value.

; drawing loop program
; initialization
  LDI r14, 0x634DFF
  LDI r9, 1885
  LDI r7, 0
  LDI r31, 77
  LDI r15, 0xDB857A
  LDI r2, 2
  LDI r5, 8
  LDI r3, 255
main_0:
  SHLI r1, r4, 256
  SHLI r2, r7, 6
  SAR r8, r2, r9
  IKEY r14
  CMPI r14, 89
  JNZ r14, key_1
  ANDI r2, r5, 0x6C8004
  FRAME
  JMP main_0
