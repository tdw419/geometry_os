; DESCRIPTION: Draws a green rectangle at (371, 23) with width 30 and height 118.
; PLAN: r0=371(x), r1=23(y), r2=30(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 23
LDI r2, 30
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
