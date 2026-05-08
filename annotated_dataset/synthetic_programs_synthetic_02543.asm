; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it performs operations such as loading instructions into registers, performing arithmetic and logical operations, and updating graphics on the screen. The loop continues indefinitely due to the `JMP` instruction at the end.

; input driven program
; initialization
  LDI r9, 128
  LDI r10, 8
  LDI r3, 255
  LDI r4, 1462
  LDI r13, 1774
  LDI r26, 557
main_0:
  LDI r8, 0x6D27A5
  FILL r8
  SUBI r1, r6, 115
  LDI r6, 0x6CAC52
  LDI r1, 0x3E1D8B
  LDI r4, 0x796DC4
  PSET r6, r1, r4
  XOR r5, r1, r6
  XOR r13, r1, r14
  OR r7, r14, r12
  XOR r2, r11, r3
  ADD r10, r15, r7
  FRAME
  JMP main_0
