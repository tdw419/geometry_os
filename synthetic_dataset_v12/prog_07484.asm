; DESCRIPTION: Draws a purple rectangle at (42, 103) with width 28 and height 83.
; PLAN: r0=42(x), r1=103(y), r2=28(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 103
LDI r2, 28
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
