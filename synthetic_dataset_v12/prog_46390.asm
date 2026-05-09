; DESCRIPTION: Renders a red line between points (399, 95) and (133, 112).
; PLAN: r0=399(x1), r1=95(y1), r2=133(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 95
LDI r2, 133
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
