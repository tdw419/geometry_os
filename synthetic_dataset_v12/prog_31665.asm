; DESCRIPTION: Draws a black rectangle at (25, 56) with width 17 and height 63.
; PLAN: r0=25(x), r1=56(y), r2=17(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 56
LDI r2, 17
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
