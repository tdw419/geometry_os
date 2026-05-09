; DESCRIPTION: Draws a purple rectangle at (133, 45) with width 55 and height 93.
; PLAN: r0=133(x), r1=45(y), r2=55(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 45
LDI r2, 55
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
