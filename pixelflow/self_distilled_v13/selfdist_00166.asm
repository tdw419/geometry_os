; DESCRIPTION: Draws a purple rectangle at (363, 45) with width 117 and height 55.
; PLAN: r0=363(x), r1=45(y), r2=117(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 45
LDI r2, 117
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
