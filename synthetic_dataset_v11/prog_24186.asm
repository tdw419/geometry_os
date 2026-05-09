; DESCRIPTION: Draws a black rectangle at (24, 9) with width 83 and height 73.
; PLAN: r0=24(x), r1=9(y), r2=83(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 9
LDI r2, 83
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
