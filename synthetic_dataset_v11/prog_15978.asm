; DESCRIPTION: Draws a black rectangle at (144, 17) with width 20 and height 92.
; PLAN: r0=144(x), r1=17(y), r2=20(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 17
LDI r2, 20
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
