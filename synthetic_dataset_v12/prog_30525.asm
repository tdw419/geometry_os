; DESCRIPTION: Draws a black rectangle at (227, 130) with width 83 and height 107.
; PLAN: r0=227(x), r1=130(y), r2=83(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 130
LDI r2, 83
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
