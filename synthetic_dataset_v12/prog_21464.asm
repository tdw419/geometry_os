; DESCRIPTION: Places a purple line segment connecting (452, 76) to (105, 126).
; PLAN: r0=452(x1), r1=76(y1), r2=105(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 76
LDI r2, 105
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
