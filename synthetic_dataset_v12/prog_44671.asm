; DESCRIPTION: Draws a purple rectangle at (342, 162) with width 110 and height 32.
; PLAN: r0=342(x), r1=162(y), r2=110(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 162
LDI r2, 110
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
