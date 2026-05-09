; DESCRIPTION: Renders a purple box of size 55x110 starting at (393, 119).
; PLAN: r0=393(x), r1=119(y), r2=55(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 119
LDI r2, 55
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
