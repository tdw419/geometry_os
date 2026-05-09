; DESCRIPTION: Draws a blue rectangle at (33, 118) with width 31 and height 56.
; PLAN: r0=33(x), r1=118(y), r2=31(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 118
LDI r2, 31
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
