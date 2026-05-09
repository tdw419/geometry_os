; DESCRIPTION: Draws a purple rectangle at (285, 31) with width 45 and height 115.
; PLAN: r0=285(x), r1=31(y), r2=45(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 31
LDI r2, 45
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
