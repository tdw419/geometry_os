; DESCRIPTION: Renders a red line between points (69, 34) and (468, 85).
; PLAN: r0=69(x1), r1=34(y1), r2=468(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 34
LDI r2, 468
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
