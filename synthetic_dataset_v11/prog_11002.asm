; DESCRIPTION: Draws a green rectangle at (26, 15) with width 16 and height 106.
; PLAN: r0=26(x), r1=15(y), r2=16(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 15
LDI r2, 16
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
