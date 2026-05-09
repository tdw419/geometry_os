; DESCRIPTION: Renders a red line between points (390, 92) and (115, 206).
; PLAN: r0=390(x1), r1=92(y1), r2=115(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 92
LDI r2, 115
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
