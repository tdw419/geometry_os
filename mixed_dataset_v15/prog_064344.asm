; DESCRIPTION: Draws a purple rectangle at (186, 162) with width 31 and height 99.
; PLAN: r0=186(x), r1=162(y), r2=31(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 162
LDI r2, 31
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
