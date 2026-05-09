; DESCRIPTION: Renders a purple box of size 45x119 starting at (389, 137).
; PLAN: r0=389(x), r1=137(y), r2=45(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 137
LDI r2, 45
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
