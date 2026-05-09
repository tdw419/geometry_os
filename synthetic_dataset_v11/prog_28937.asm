; DESCRIPTION: Draws a purple rectangle at (42, 109) with width 108 and height 53.
; PLAN: r0=42(x), r1=109(y), r2=108(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 109
LDI r2, 108
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
