; DESCRIPTION: Draws a black rectangle at (57, 83) with width 15 and height 112.
; PLAN: r0=57(x), r1=83(y), r2=15(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 83
LDI r2, 15
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
