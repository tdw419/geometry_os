; DESCRIPTION: Draws a purple rectangle at (42, 103) with width 100 and height 87.
; PLAN: r0=42(x), r1=103(y), r2=100(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 103
LDI r2, 100
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
