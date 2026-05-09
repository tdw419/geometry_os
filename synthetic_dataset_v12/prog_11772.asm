; DESCRIPTION: Draws a purple rectangle at (212, 124) with width 51 and height 42.
; PLAN: r0=212(x), r1=124(y), r2=51(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 124
LDI r2, 51
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
