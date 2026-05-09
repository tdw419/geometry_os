; DESCRIPTION: Renders a red line between points (55, 73) and (169, 207).
; PLAN: r0=55(x1), r1=73(y1), r2=169(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 73
LDI r2, 169
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
