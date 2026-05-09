; DESCRIPTION: Draws a blue rectangle at (447, 162) with width 25 and height 37.
; PLAN: r0=447(x), r1=162(y), r2=25(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 162
LDI r2, 25
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
