; DESCRIPTION: Renders a purple box of size 119x89 starting at (375, 58).
; PLAN: r0=375(x), r1=58(y), r2=119(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 58
LDI r2, 119
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
