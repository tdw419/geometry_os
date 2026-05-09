; DESCRIPTION: Draws a black rectangle at (142, 144) with width 96 and height 56.
; PLAN: r0=142(x), r1=144(y), r2=96(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 144
LDI r2, 96
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
