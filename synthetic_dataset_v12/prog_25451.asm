; DESCRIPTION: Draws a black rectangle at (286, 35) with width 63 and height 19.
; PLAN: r0=286(x), r1=35(y), r2=63(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 35
LDI r2, 63
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
