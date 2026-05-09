; DESCRIPTION: Renders a purple line between points (9, 218) and (174, 93).
; PLAN: r0=9(x1), r1=218(y1), r2=174(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 218
LDI r2, 174
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
