; DESCRIPTION: Draws a purple rectangle at (189, 48) with width 115 and height 78.
; PLAN: r0=189(x), r1=48(y), r2=115(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 48
LDI r2, 115
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
