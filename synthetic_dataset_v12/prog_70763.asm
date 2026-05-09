; DESCRIPTION: Draws a purple rectangle at (27, 153) with width 84 and height 55.
; PLAN: r0=27(x), r1=153(y), r2=84(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 153
LDI r2, 84
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
