; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, checks for two different key inputs (0xC8EC9A and 224), draws the text "WORLD" on the screen if the first key is detected, fills a rectangle if the second key is detected, and then halts execution.

; mixed program
; initialization
  LDI r3, 4024
  LDI r7, 3420
  LDI r15, 3352
  LDI r5, 2707
  LDI r13, 2409
  LDI r12, 0x8A33D4
  IKEY r2
  CMPI r2, 0xC8EC9A
  JNZ r2, key_0
  LDI r2, 1
  LDI r7, 128
  LDI r12, 3703
  DRAWTEXT r2, r7, r12, "WORLD"
  IKEY r11
  CMPI r11, 224
  JNZ r11, key_1
  LDI r15, 524
  FILL r15
  HALT
