; DESCRIPTION: Renders a red line between points (51, 87) and (508, 121).
; PLAN: r0=51(x1), r1=87(y1), r2=508(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 87
LDI r2, 508
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
