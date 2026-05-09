; DESCRIPTION: Renders a purple box of size 19x10 starting at (201, 217).
; PLAN: r0=201(x), r1=217(y), r2=19(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 217
LDI r2, 19
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
