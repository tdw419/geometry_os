; DESCRIPTION: Places a red line segment connecting (448, 2) to (427, 20).
; PLAN: r0=448(x1), r1=2(y1), r2=427(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 2
LDI r2, 427
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
