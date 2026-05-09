; DESCRIPTION: Draws a yellow rectangle at (31, 130) with width 83 and height 116.
; PLAN: r0=31(x), r1=130(y), r2=83(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 130
LDI r2, 83
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
