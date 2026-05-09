; DESCRIPTION: Draws a purple rectangle at (332, 109) with width 30 and height 86.
; PLAN: r0=332(x), r1=109(y), r2=30(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 109
LDI r2, 30
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
