; DESCRIPTION: Draws a purple rectangle at (435, 71) with width 36 and height 42.
; PLAN: r0=435(x), r1=71(y), r2=36(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 71
LDI r2, 36
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
