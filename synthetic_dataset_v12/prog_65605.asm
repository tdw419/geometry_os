; DESCRIPTION: Draws a purple rectangle at (87, 18) with width 106 and height 104.
; PLAN: r0=87(x), r1=18(y), r2=106(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 18
LDI r2, 106
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
