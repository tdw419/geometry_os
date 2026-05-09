; DESCRIPTION: Renders a blue line between points (290, 150) and (194, 87).
; PLAN: r0=290(x1), r1=150(y1), r2=194(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 150
LDI r2, 194
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
