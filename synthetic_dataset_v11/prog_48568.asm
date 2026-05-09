; DESCRIPTION: Composite: . Then Places a purple dot at position (133, 110). Then Renders a blue box of size 85x79 starting at (11, 119).
; PLAN: r0=133(x), r1=110(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=11(x), r1=119(y), r2=85(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (133, 110).
; PLAN: r0=133(x), r1=110(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 110
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue box of size 85x79 starting at (11, 119).
; PLAN: r0=11(x), r1=119(y), r2=85(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 119
LDI r2, 85
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
