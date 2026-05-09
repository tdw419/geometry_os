; DESCRIPTION: Renders a red line between points (31, 77) and (70, 144).
; PLAN: r0=31(x1), r1=77(y1), r2=70(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 77
LDI r2, 70
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
