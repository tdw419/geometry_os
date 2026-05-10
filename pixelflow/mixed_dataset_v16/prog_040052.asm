; DESCRIPTION: Draws a blue rectangle at (260, 91) with width 34 and height 66.
; PLAN: r0=260(x), r1=91(y), r2=34(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 91
LDI r2, 34
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
