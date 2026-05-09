; DESCRIPTION: Renders a red line between points (211, 144) and (22, 168).
; PLAN: r0=211(x1), r1=144(y1), r2=22(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 144
LDI r2, 22
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
