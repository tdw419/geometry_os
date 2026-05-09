; DESCRIPTION: Draws a purple rectangle at (118, 189) with width 90 and height 42.
; PLAN: r0=118(x), r1=189(y), r2=90(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 189
LDI r2, 90
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
