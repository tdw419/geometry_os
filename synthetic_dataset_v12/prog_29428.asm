; DESCRIPTION: Draws a white rectangle at (116, 95) with width 96 and height 22.
; PLAN: r0=116(x), r1=95(y), r2=96(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 95
LDI r2, 96
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
