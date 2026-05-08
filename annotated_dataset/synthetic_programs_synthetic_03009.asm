; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters a loop where it performs bitwise operations, compares register values, and prints the string "HELLO" to the console. The loop continues indefinitely due to the `JMP` instruction at the end.

; input driven program
; initialization
  LDI r15, 0x28583C
  LDI r2, 64
  LDI r7, 3616
  LDI r3, 219
  LDI r8, 0xC2593A
  LDI r14, 256
  LDI r18, 2348
  LDI r0, 3056
main_0:
  CMP r3, r10
  SHL r15, r14, r2
  SAR r12, r9, r10
  CMP r6, r8
  LDI r6, 3189
  LDI r5, 1315
  LDI r15, 0x2AB87D
  TEXT r6, r5, r15, "HELLO"
  XOR r10, r6, r2
  OR r10, r7, r2
  XOR r12, r11, r7
  OR r12, r8, r9
  FRAME
  JMP main_0
