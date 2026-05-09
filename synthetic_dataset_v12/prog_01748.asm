; DESCRIPTION: Draws a black rectangle at (43, 18) with width 80 and height 33.
; PLAN: r0=43(x), r1=18(y), r2=80(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 18
LDI r2, 80
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
