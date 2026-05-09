; DESCRIPTION: Draws a purple rectangle at (48, 126) with width 73 and height 47.
; PLAN: r0=48(x), r1=126(y), r2=73(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 126
LDI r2, 73
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
