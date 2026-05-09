; DESCRIPTION: Draws a purple rectangle at (232, 42) with width 37 and height 39.
; PLAN: r0=232(x), r1=42(y), r2=37(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 42
LDI r2, 37
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
