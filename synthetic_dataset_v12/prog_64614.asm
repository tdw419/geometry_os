; DESCRIPTION: Draws a blue rectangle at (216, 20) with width 16 and height 114.
; PLAN: r0=216(x), r1=20(y), r2=16(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 20
LDI r2, 16
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
