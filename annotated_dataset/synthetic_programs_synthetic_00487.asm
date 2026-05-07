; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, sets up a text display at coordinates (8, 0x600985) with the string "HELLO", enters a loop that performs a series of operations including setting a pixel, modifying registers, and writing pixels until a counter reaches zero. It then checks for a key press and halts if the key code is 145.

; mixed program
; initialization
  LDI r0, 1844
  LDI r14, 0xF0AD0D
  LDI r11, 2164
  LDI r25, 0x15599E
  LDI r10, 0x7FEEDA
  LDI r5, 0xD5BE65
  LDI r9, 2940
  LDI r6, 8
  LDI r26, 0x600985
  LDI r10, 0xF2244E
  TEXT r6, r26, r10, "HELLO"
  LDI r5, 4
loop_0:
  LDI r11, 0xB7FF18
  LDI r12, 0x147669
  LDI r7, 10
  PSET r11, r12, r7
  OR r3, r1, r8
  MOD r11, r10, r3
  LDI r2, 0x1BFC9C
  LDI r6, 0x29F989
  LDI r3, 829
  WPIXEL
  LDI r14, 1
  SUB r5, r5, r14
  JNZ r5, loop_0
  SAR r14, r3, r4
  SHR r3, r10, r4
  IKEY r0
  CMPI r0, 145
  JNZ r0, key_1
  HALT
