; DESCRIPTION: Renders a red line between points (132, 7) and (89, 135).
; PLAN: r0=132(x1), r1=7(y1), r2=89(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 7
LDI r2, 89
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
