; DESCRIPTION: Renders a red line between points (45, 8) and (106, 180).
; PLAN: r0=45(x1), r1=8(y1), r2=106(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 8
LDI r2, 106
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
