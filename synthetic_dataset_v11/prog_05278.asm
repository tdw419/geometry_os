; DESCRIPTION: Renders a magenta line between points (251, 119) and (142, 12).
; PLAN: r0=251(x1), r1=119(y1), r2=142(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 119
LDI r2, 142
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
