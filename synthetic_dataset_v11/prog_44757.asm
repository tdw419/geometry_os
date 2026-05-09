; DESCRIPTION: Draws a purple rectangle at (171, 3) with width 84 and height 104.
; PLAN: r0=171(x), r1=3(y), r2=84(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 3
LDI r2, 84
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
