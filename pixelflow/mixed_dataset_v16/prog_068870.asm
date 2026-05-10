; DESCRIPTION: Places a green line segment connecting (361, 101) to (477, 119).
; PLAN: r0=361(x1), r1=101(y1), r2=477(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 101
LDI r2, 477
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
