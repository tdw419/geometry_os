; DESCRIPTION: Places a black line segment connecting (471, 238) to (452, 159).
; PLAN: r0=471(x1), r1=238(y1), r2=452(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 238
LDI r2, 452
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
