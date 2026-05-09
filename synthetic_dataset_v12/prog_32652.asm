; DESCRIPTION: Draws a blue rectangle at (158, 106) with width 16 and height 15.
; PLAN: r0=158(x), r1=106(y), r2=16(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 106
LDI r2, 16
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
