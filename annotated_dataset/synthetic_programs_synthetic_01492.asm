; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop (`main_0`) where it performs various operations including comparisons, logical shifts, arithmetic shifts, and bitwise operations. It also includes a `TEXT` instruction to display "HELLO" on the screen and uses control flow instructions like `JMP` to repeat the loop indefinitely.

; input driven program
; initialization
  LDI r6, 3987
  LDI r2, 0x504CE8
main_0:
  CMP r4, r14
  LDI r11, 0x998FE7
  FILL r11
  SHLI r14, r4, 5
  SAR r0, r13, r15
  AND r14, r25, r4
  XOR r14, r2, r13
  LDI r18, 1119
  LDI r14, 10
  LDI r3, 64
  TEXT r18, r14, r3, "HELLO"
  SHL r11, r2, r1
  SHLI r12, r19, 5
  SHL r8, r14, r11
  SHLI r11, r14, 0x185866
  FRAME
  JMP main_0
