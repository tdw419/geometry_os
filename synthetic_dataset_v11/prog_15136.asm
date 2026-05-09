; DESCRIPTION: Draws a blue rectangle at (18, 29) with width 114 and height 118.
; PLAN: r0=18(x), r1=29(y), r2=114(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 29
LDI r2, 114
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
