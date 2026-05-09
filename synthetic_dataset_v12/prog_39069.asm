; DESCRIPTION: Draws a black rectangle at (287, 13) with width 18 and height 43.
; PLAN: r0=287(x), r1=13(y), r2=18(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 13
LDI r2, 18
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
