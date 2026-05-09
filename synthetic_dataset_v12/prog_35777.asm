; DESCRIPTION: Draws a yellow rectangle at (373, 49) with width 32 and height 88.
; PLAN: r0=373(x), r1=49(y), r2=32(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 49
LDI r2, 32
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
