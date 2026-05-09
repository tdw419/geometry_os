; DESCRIPTION: Renders a purple box of size 93x85 starting at (149, 141).
; PLAN: r0=149(x), r1=141(y), r2=93(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 141
LDI r2, 93
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
