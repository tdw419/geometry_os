; DESCRIPTION: Draws a yellow rectangle at (379, 136) with width 14 and height 14.
; PLAN: r0=379(x), r1=136(y), r2=14(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 136
LDI r2, 14
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
