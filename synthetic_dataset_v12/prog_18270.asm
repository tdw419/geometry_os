; DESCRIPTION: Places a red line segment connecting (428, 34) to (160, 112).
; PLAN: r0=428(x1), r1=34(y1), r2=160(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 34
LDI r2, 160
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
