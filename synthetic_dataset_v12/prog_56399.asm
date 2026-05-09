; DESCRIPTION: Renders a red line between points (65, 201) and (414, 48).
; PLAN: r0=65(x1), r1=201(y1), r2=414(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 201
LDI r2, 414
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
