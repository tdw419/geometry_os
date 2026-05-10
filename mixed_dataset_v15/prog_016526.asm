; DESCRIPTION: Draws a purple rectangle at (45, 176) with width 55 and height 21.
; PLAN: r0=45(x), r1=176(y), r2=55(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 176
LDI r2, 55
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
