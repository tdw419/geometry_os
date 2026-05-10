; DESCRIPTION: Draws a green rectangle at (194, 135) with width 27 and height 96.
; PLAN: r0=194(x), r1=135(y), r2=27(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 135
LDI r2, 27
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
