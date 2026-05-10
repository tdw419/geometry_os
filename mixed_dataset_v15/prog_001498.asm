; DESCRIPTION: Renders a red line between points (468, 175) and (45, 169).
; PLAN: r0=468(x1), r1=175(y1), r2=45(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 175
LDI r2, 45
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
