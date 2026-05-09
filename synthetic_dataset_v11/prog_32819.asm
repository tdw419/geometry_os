; DESCRIPTION: Draws a blue rectangle at (118, 125) with width 68 and height 114.
; PLAN: r0=118(x), r1=125(y), r2=68(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 125
LDI r2, 68
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
