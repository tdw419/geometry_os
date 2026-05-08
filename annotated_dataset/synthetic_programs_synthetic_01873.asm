; DESCRIPTION: This GeOS assembly code initializes registers with specific values and then calls the `RECTF` function to draw a filled rectangle on the screen. The program halts afterward.

; simple draw program
; initialization
  LDI r5, 3883
  LDI r0, 1625
  LDI r12, 0
  LDI r2, 0x551203
  LDI r7, 2550
  LDI r3, 0xEC7714
  LDI r19, 0x1E1FE5
  LDI r9, 2985
  RECTF r2, r7, r3, r19, r9
  HALT
