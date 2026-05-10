; DESCRIPTION: Renders a purple box of size 93x112 starting at (62, 93).
; PLAN: r0=62(x), r1=93(y), r2=93(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 93
LDI r2, 93
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
