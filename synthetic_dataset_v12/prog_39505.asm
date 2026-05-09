; DESCRIPTION: Renders a red line between points (200, 143) and (229, 227).
; PLAN: r0=200(x1), r1=143(y1), r2=229(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 143
LDI r2, 229
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
