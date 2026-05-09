; DESCRIPTION: Renders a purple box of size 42x112 starting at (22, 0).
; PLAN: r0=22(x), r1=0(y), r2=42(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 0
LDI r2, 42
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
