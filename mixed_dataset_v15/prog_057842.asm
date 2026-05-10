; DESCRIPTION: Renders a red line between points (185, 96) and (133, 90).
; PLAN: r0=185(x1), r1=96(y1), r2=133(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 96
LDI r2, 133
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
