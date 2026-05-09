; DESCRIPTION: Renders a blue line between points (217, 201) and (47, 65).
; PLAN: r0=217(x1), r1=201(y1), r2=47(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 201
LDI r2, 47
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
