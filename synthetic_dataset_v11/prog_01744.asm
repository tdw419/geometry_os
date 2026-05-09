; DESCRIPTION: Draws a black rectangle at (49, 226) with width 119 and height 21.
; PLAN: r0=49(x), r1=226(y), r2=119(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 226
LDI r2, 119
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
