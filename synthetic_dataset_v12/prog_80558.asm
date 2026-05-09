; DESCRIPTION: Renders a purple box of size 119x45 starting at (201, 145).
; PLAN: r0=201(x), r1=145(y), r2=119(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 145
LDI r2, 119
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
