; DESCRIPTION: Draws a purple rectangle at (104, 10) with width 75 and height 93.
; PLAN: r0=104(x), r1=10(y), r2=75(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 10
LDI r2, 75
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
