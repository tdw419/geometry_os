; DESCRIPTION: Draws a purple rectangle at (407, 123) with width 61 and height 32.
; PLAN: r0=407(x), r1=123(y), r2=61(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 123
LDI r2, 61
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
