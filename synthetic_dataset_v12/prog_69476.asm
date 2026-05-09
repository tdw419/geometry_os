; DESCRIPTION: Draws a black rectangle at (424, 97) with width 19 and height 120.
; PLAN: r0=424(x), r1=97(y), r2=19(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 97
LDI r2, 19
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
