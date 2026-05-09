; DESCRIPTION: Renders a purple box of size 23x89 starting at (22, 68).
; PLAN: r0=22(x), r1=68(y), r2=23(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 68
LDI r2, 23
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
