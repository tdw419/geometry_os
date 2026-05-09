; DESCRIPTION: Draws a purple rectangle at (27, 77) with width 76 and height 45.
; PLAN: r0=27(x), r1=77(y), r2=76(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 77
LDI r2, 76
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
