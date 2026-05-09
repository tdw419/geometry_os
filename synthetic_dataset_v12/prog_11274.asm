; DESCRIPTION: Draws a yellow rectangle at (119, 135) with width 85 and height 40.
; PLAN: r0=119(x), r1=135(y), r2=85(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 135
LDI r2, 85
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
