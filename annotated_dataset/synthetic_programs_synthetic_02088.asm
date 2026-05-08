; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly loads new values into registers, performs bitwise operations (ANDI, SHL, SAR), shifts bits left and right, and outputs text "HELLO" using the TEXT instruction. The loop continues indefinitely due to the JMP instruction at the end.

; input driven program
; initialization
  LDI r18, 294
  LDI r0, 2
  LDI r7, 2921
  LDI r5, 0x88C4C4
  LDI r13, 0x9960D1
  LDI r4, 0x1CF1A2
main_0:
  LDI r13, 0xDAF1A1
  LDI r15, 0xCA4EF2
  LDI r15, 255
  TEXT r13, r15, r15, "HELLO"
  ANDI r14, r1, 66
  SHL r0, r3, r22
  SAR r6, r21, r7
  SHL r2, r6, r1
  SAR r14, r11, r12
  SHL r0, r13, r7
  SHLI r5, r7, 255
  SHLI r0, r9, 6
  FRAME
  JMP main_0
