; DESCRIPTION: Draws a purple rectangle at (120, 93) with width 51 and height 73.
; PLAN: r0=120(x), r1=93(y), r2=51(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 93
LDI r2, 51
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
