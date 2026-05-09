; DESCRIPTION: Draws a black rectangle at (427, 90) with width 19 and height 63.
; PLAN: r0=427(x), r1=90(y), r2=19(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 90
LDI r2, 19
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
