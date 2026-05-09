; DESCRIPTION: Draws a purple rectangle at (379, 241) with width 29 and height 11.
; PLAN: r0=379(x), r1=241(y), r2=29(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 241
LDI r2, 29
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
