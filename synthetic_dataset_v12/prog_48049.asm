; DESCRIPTION: Draws a purple rectangle at (274, 21) with width 103 and height 96.
; PLAN: r0=274(x), r1=21(y), r2=103(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 21
LDI r2, 103
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
