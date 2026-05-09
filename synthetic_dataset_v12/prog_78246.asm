; DESCRIPTION: Draws a black rectangle at (361, 19) with width 24 and height 62.
; PLAN: r0=361(x), r1=19(y), r2=24(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 19
LDI r2, 24
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
