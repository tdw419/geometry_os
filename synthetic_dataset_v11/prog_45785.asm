; DESCRIPTION: Draws a blue rectangle at (81, 116) with width 73 and height 66.
; PLAN: r0=81(x), r1=116(y), r2=73(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 116
LDI r2, 73
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
