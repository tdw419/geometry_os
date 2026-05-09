; DESCRIPTION: Renders a red line between points (166, 143) and (200, 80).
; PLAN: r0=166(x1), r1=143(y1), r2=200(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 143
LDI r2, 200
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
