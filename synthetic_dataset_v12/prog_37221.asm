; DESCRIPTION: Draws a green rectangle at (194, 15) with width 96 and height 113.
; PLAN: r0=194(x), r1=15(y), r2=96(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 15
LDI r2, 96
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
