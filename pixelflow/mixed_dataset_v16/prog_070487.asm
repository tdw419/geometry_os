; DESCRIPTION: Draws a purple rectangle at (266, 2) with width 104 and height 120.
; PLAN: r0=266(x), r1=2(y), r2=104(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 2
LDI r2, 104
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
