; DESCRIPTION: Renders a red line between points (80, 51) and (8, 180).
; PLAN: r0=80(x1), r1=51(y1), r2=8(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 51
LDI r2, 8
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
