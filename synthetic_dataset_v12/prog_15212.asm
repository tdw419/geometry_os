; DESCRIPTION: Draws a black rectangle at (179, 178) with width 17 and height 35.
; PLAN: r0=179(x), r1=178(y), r2=17(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 178
LDI r2, 17
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
