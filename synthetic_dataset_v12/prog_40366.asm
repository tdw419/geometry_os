; DESCRIPTION: Places a red line segment connecting (382, 7) to (448, 123).
; PLAN: r0=382(x1), r1=7(y1), r2=448(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 7
LDI r2, 448
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
