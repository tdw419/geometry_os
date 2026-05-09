; DESCRIPTION: Places a yellow line segment connecting (486, 253) to (477, 119).
; PLAN: r0=486(x1), r1=253(y1), r2=477(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 253
LDI r2, 477
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
