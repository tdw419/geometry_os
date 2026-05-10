; DESCRIPTION: Renders a purple box of size 110x89 starting at (330, 2).
; PLAN: r0=330(x), r1=2(y), r2=110(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 2
LDI r2, 110
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
