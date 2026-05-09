; DESCRIPTION: Draws a blue rectangle at (361, 90) with width 26 and height 118.
; PLAN: r0=361(x), r1=90(y), r2=26(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 90
LDI r2, 26
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
