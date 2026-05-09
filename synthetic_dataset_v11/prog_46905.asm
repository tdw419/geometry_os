; DESCRIPTION: Draws a black rectangle at (181, 15) with width 56 and height 38.
; PLAN: r0=181(x), r1=15(y), r2=56(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 15
LDI r2, 56
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
