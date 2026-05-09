; DESCRIPTION: Draws a blue rectangle at (134, 156) with width 96 and height 93.
; PLAN: r0=134(x), r1=156(y), r2=96(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 156
LDI r2, 96
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
