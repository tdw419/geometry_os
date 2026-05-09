; DESCRIPTION: Draws a black rectangle at (128, 136) with width 78 and height 21.
; PLAN: r0=128(x), r1=136(y), r2=78(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 136
LDI r2, 78
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
