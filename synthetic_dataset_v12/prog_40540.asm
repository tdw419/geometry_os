; DESCRIPTION: Draws a black rectangle at (196, 52) with width 55 and height 106.
; PLAN: r0=196(x), r1=52(y), r2=55(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 52
LDI r2, 55
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
