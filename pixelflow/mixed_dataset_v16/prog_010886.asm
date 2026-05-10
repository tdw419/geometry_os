; DESCRIPTION: Draws a yellow rectangle at (172, 100) with width 68 and height 112.
; PLAN: r0=172(x), r1=100(y), r2=68(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 100
LDI r2, 68
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
