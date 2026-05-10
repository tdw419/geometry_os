; DESCRIPTION: Draws a purple rectangle at (13, 93) with width 60 and height 78.
; PLAN: r0=13(x), r1=93(y), r2=60(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 93
LDI r2, 60
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
