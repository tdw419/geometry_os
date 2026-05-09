; DESCRIPTION: Draws a blue rectangle at (227, 118) with width 32 and height 44.
; PLAN: r0=227(x), r1=118(y), r2=32(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 118
LDI r2, 32
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
