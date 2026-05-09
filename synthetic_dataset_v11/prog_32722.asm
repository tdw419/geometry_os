; DESCRIPTION: Draws a purple rectangle at (206, 105) with width 29 and height 45.
; PLAN: r0=206(x), r1=105(y), r2=29(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 105
LDI r2, 29
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
