; DESCRIPTION: Renders a purple box of size 33x37 starting at (201, 196).
; PLAN: r0=201(x), r1=196(y), r2=33(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 196
LDI r2, 33
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
