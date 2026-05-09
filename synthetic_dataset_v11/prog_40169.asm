; DESCRIPTION: Renders a purple line between points (95, 33) and (83, 83).
; PLAN: r0=95(x1), r1=33(y1), r2=83(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 33
LDI r2, 83
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
