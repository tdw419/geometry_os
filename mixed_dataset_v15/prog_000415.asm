; DESCRIPTION: Draws a purple rectangle at (79, 169) with width 104 and height 24.
; PLAN: r0=79(x), r1=169(y), r2=104(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 169
LDI r2, 104
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
