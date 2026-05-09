; DESCRIPTION: Draws a blue rectangle at (170, 40) with width 81 and height 90.
; PLAN: r0=170(x), r1=40(y), r2=81(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 40
LDI r2, 81
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
