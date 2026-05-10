; DESCRIPTION: Draws a purple rectangle at (400, 109) with width 58 and height 95.
; PLAN: r0=400(x), r1=109(y), r2=58(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 109
LDI r2, 58
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
