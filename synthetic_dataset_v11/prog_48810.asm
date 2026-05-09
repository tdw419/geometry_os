; DESCRIPTION: Renders a red line between points (71, 45) and (132, 136).
; PLAN: r0=71(x1), r1=45(y1), r2=132(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 45
LDI r2, 132
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
