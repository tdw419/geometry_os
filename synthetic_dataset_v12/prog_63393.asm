; DESCRIPTION: Draws a black rectangle at (5, 144) with width 52 and height 43.
; PLAN: r0=5(x), r1=144(y), r2=52(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 144
LDI r2, 52
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
