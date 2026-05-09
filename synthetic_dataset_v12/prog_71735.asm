; DESCRIPTION: Renders a purple box of size 42x42 starting at (216, 100).
; PLAN: r0=216(x), r1=100(y), r2=42(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 100
LDI r2, 42
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
