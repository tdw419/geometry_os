; DESCRIPTION: Draws a yellow rectangle at (14, 172) with width 84 and height 24.
; PLAN: r0=14(x), r1=172(y), r2=84(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 172
LDI r2, 84
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
