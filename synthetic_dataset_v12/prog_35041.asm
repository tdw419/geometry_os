; DESCRIPTION: Draws a black rectangle at (144, 52) with width 73 and height 90.
; PLAN: r0=144(x), r1=52(y), r2=73(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 52
LDI r2, 73
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
