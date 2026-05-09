; DESCRIPTION: Draws a purple rectangle at (56, 163) with width 115 and height 93.
; PLAN: r0=56(x), r1=163(y), r2=115(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 163
LDI r2, 115
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
