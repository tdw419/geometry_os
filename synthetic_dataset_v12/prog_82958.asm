; DESCRIPTION: Draws a orange rectangle at (136, 124) with width 119 and height 73.
; PLAN: r0=136(x), r1=124(y), r2=119(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 124
LDI r2, 119
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
