; DESCRIPTION: Draws a purple rectangle at (68, 68) with width 45 and height 87.
; PLAN: r0=68(x), r1=68(y), r2=45(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 68
LDI r2, 45
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
