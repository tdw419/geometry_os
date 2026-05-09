; DESCRIPTION: Draws a blue rectangle at (439, 118) with width 17 and height 49.
; PLAN: r0=439(x), r1=118(y), r2=17(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 118
LDI r2, 17
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
