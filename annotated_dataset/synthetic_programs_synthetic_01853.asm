; DESCRIPTION: This GeOS assembly code initializes several registers and enters a loop where it draws a circle with specific parameters and prints the text "HELLO" at a designated position. The loop continuously executes these operations without any termination condition shown in the provided code snippet.

; drawing loop program
; initialization
  LDI r9, 0xA0950B
  LDI r5, 32
  LDI r24, 10
  LDI r4, 979
  LDI r2, 4
  LDI r15, 4
  LDI r10, 256
  LDI r7, 1406
main_0:
  LDI r10, 1099
  LDI r6, 1981
  LDI r4, 3392
  LDI r9, 0x473326
  CIRCLE r10, r6, r4, r9
  CMPI r12, 8
  LDI r14, 2919
  LDI r0, 4005
  LDI r2, 4
  TEXT r14, r0, r2, "HELLO"
  XOR r0, r23, r5
  OR r15, r11, r1
  XOR r15, r2, r7
  OR r8, r28, r5
  AND r3, r2, r5
  XOR r14, r12, r11
  XOR r4, r8, r10
  FRAME
  JMP main_0
