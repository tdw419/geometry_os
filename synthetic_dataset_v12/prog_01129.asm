; DESCRIPTION: Places a purple line segment connecting (310, 238) to (87, 2).
; PLAN: r0=310(x1), r1=238(y1), r2=87(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 238
LDI r2, 87
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
