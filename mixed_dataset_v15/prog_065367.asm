; DESCRIPTION: Draws a purple rectangle at (214, 4) with width 102 and height 119.
; PLAN: r0=214(x), r1=4(y), r2=102(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 4
LDI r2, 102
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
