; DESCRIPTION: Draws a purple rectangle at (400, 31) with width 74 and height 14.
; PLAN: r0=400(x), r1=31(y), r2=74(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 31
LDI r2, 74
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
