; DESCRIPTION: Renders a purple line between points (290, 81) and (166, 185).
; PLAN: r0=290(x1), r1=81(y1), r2=166(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 81
LDI r2, 166
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
