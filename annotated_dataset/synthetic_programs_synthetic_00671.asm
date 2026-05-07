; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it waits for two input keys. If the first key matches `0xF8B5A7` and the second key matches `252`, it calls a function labeled `FRAME`. The program then repeats this process indefinitely.

; input driven program
; initialization
  LDI r6, 64
  LDI r2, 21
  LDI r5, 1701
  LDI r4, 0x8D22F4
  LDI r15, 2625
main_0:
  IKEY r10
  CMPI r10, 0xF8B5A7
  JNZ r10, key_1
  IKEY r11
  CMPI r11, 252
  JNZ r11, key_2
  FRAME
  JMP main_0
