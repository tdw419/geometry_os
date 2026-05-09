; DESCRIPTION: Renders a purple box of size 109x93 starting at (58, 162).
; PLAN: r0=58(x), r1=162(y), r2=109(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 162
LDI r2, 109
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
