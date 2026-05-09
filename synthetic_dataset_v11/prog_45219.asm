; DESCRIPTION: Renders a purple box of size 62x67 starting at (155, 42).
; PLAN: r0=155(x), r1=42(y), r2=62(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 42
LDI r2, 62
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
