; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs bitwise operations including OR, AND, and XOR, fills a memory location, and then draws the text "WORLD" at a specified position on the screen before halting execution.

; mixed program
; initialization
  LDI r11, 64
  LDI r14, 16
  LDI r7, 0xC75940
  LDI r1, 2
  LDI r6, 8
  FILL r6
  OR r14, r2, r0
  AND r6, r8, r10
  XOR r5, r25, r3
  OR r1, r23, r4
  LDI r11, 3349
  LDI r1, 4
  LDI r12, 2095
  DRAWTEXT r11, r1, r12, "WORLD"
  HALT
