; DESCRIPTION: Renders a red line between points (321, 162) and (424, 60).
; PLAN: r0=321(x1), r1=162(y1), r2=424(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 162
LDI r2, 424
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
