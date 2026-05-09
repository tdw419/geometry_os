; DESCRIPTION: Draws a yellow rectangle at (29, 85) with width 25 and height 97.
; PLAN: r0=29(x), r1=85(y), r2=25(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 85
LDI r2, 25
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
