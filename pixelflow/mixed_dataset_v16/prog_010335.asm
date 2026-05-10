; DESCRIPTION: Draws a blue rectangle at (432, 33) with width 35 and height 98.
; PLAN: r0=432(x), r1=33(y), r2=35(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 33
LDI r2, 35
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
