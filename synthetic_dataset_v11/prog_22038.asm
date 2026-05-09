; DESCRIPTION: Draws a blue rectangle at (12, 91) with width 91 and height 106.
; PLAN: r0=12(x), r1=91(y), r2=91(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 91
LDI r2, 91
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
