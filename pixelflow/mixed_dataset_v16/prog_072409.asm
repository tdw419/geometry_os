; DESCRIPTION: Renders a red line between points (56, 241) and (266, 133).
; PLAN: r0=56(x1), r1=241(y1), r2=266(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 241
LDI r2, 266
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
