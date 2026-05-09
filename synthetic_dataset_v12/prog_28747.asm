; DESCRIPTION: Places a red line segment connecting (85, 25) to (313, 112).
; PLAN: r0=85(x1), r1=25(y1), r2=313(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 25
LDI r2, 313
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
