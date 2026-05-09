; DESCRIPTION: Places a red line segment connecting (34, 56) to (51, 183).
; PLAN: r0=34(x1), r1=56(y1), r2=51(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 56
LDI r2, 51
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
