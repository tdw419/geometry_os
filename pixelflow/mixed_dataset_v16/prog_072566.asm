; DESCRIPTION: Renders a red line between points (453, 162) and (414, 75).
; PLAN: r0=453(x1), r1=162(y1), r2=414(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 162
LDI r2, 414
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
