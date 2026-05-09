; DESCRIPTION: Renders a purple line between points (373, 54) and (193, 75).
; PLAN: r0=373(x1), r1=54(y1), r2=193(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 54
LDI r2, 193
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
