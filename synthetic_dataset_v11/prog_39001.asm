; DESCRIPTION: Draws a blue rectangle at (44, 60) with width 81 and height 83.
; PLAN: r0=44(x), r1=60(y), r2=81(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 60
LDI r2, 81
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
