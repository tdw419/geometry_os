; DESCRIPTION: Draws a black rectangle at (116, 106) with width 96 and height 56.
; PLAN: r0=116(x), r1=106(y), r2=96(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 106
LDI r2, 96
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
