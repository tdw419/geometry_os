; DESCRIPTION: Draws a blue rectangle at (65, 138) with width 15 and height 118.
; PLAN: r0=65(x), r1=138(y), r2=15(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 138
LDI r2, 15
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
