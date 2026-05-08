; DESCRIPTION: This GeOS assembly code initializes the graphics system, sets two pixel points, and then draws a filled rectangle with specific dimensions and color. The program halts after completing these operations.

; simple draw program
; initialization
  LDI r13, 0x5EFBF1
  LDI r20, 3064
  LDI r2, 256
  LDI r5, 256
  LDI r15, 366
  PSETI
  LDI r8, 16
  LDI r12, 2
  LDI r6, 3310
  PSETI
  LDI r14, 10
  LDI r9, 0x746800
  LDI r5, 128
  LDI r12, 753
  LDI r13, 376
  RECTF r14, r9, r5, r12, r13
  HALT
