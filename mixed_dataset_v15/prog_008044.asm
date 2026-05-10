; DESCRIPTION: Renders a purple box of size 42x79 starting at (93, 118).
; PLAN: r0=93(x), r1=118(y), r2=42(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 118
LDI r2, 42
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
