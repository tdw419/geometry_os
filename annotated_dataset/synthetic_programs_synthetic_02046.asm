; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters an infinite loop where it performs bitwise operations (OR, XOR, AND, SHL) on these registers. The program is input-driven and utilizes a frame instruction within the loop, indicating potential stack manipulation or function call handling.

; input driven program
; initialization
  LDI r5, 1
  LDI r6, 0x28B636
  LDI r14, 0x745849
  LDI r13, 862
  LDI r1, 3567
  LDI r11, 3564
  LDI r7, 128
main_0:
  OR r8, r9, r5
  XOR r5, r7, r3
  OR r13, r4, r6
  AND r9, r10, r4
  SHL r5, r9, r11
  FRAME
  JMP main_0
