; DESCRIPTION: Draws a black rectangle at (273, 43) with width 39 and height 118.
; PLAN: r0=273(x), r1=43(y), r2=39(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 43
LDI r2, 39
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
