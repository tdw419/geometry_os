; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it performs arithmetic operations such as subtraction, addition, shift left, and bitwise shift, followed by a function call and a jump back to the start of the loop. The loop is infinite due to the unconditional jump at the end.

; input driven program
; initialization
  LDI r7, 1
  LDI r0, 8
  LDI r5, 10
  LDI r3, 0xC55C11
  LDI r15, 0x64099F
  LDI r4, 1231
  LDI r12, 0x0C98FF
main_0:
  SUBI r3, r11, 0x86533B
  ADD r10, r4, r15
  SHL r18, r0, r30
  SHLI r6, r7, 8
  FRAME
  JMP main_0
