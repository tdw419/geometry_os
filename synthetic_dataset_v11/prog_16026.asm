; DESCRIPTION: Draws a purple rectangle at (73, 7) with width 42 and height 35.
; PLAN: r0=73(x), r1=7(y), r2=42(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 7
LDI r2, 42
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
