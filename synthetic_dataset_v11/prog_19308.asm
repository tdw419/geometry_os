; DESCRIPTION: Draws a black rectangle at (112, 100) with width 52 and height 63.
; PLAN: r0=112(x), r1=100(y), r2=52(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 100
LDI r2, 52
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
