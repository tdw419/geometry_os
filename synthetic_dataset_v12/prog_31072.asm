; DESCRIPTION: Renders a purple box of size 56x42 starting at (311, 67).
; PLAN: r0=311(x), r1=67(y), r2=56(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 67
LDI r2, 56
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
