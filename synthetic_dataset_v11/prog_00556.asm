; DESCRIPTION: Draws a purple rectangle at (42, 116) with width 96 and height 60.
; PLAN: r0=42(x), r1=116(y), r2=96(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 116
LDI r2, 96
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
