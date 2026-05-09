; DESCRIPTION: Draws a black rectangle at (13, 63) with width 60 and height 112.
; PLAN: r0=13(x), r1=63(y), r2=60(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 63
LDI r2, 60
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
