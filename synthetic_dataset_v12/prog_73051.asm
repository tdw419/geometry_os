; DESCRIPTION: Draws a purple rectangle at (222, 32) with width 45 and height 55.
; PLAN: r0=222(x), r1=32(y), r2=45(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 32
LDI r2, 45
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
