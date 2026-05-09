; DESCRIPTION: Renders a red line between points (35, 112) and (164, 133).
; PLAN: r0=35(x1), r1=112(y1), r2=164(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 112
LDI r2, 164
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
