; DESCRIPTION: Renders a purple line between points (174, 123) and (57, 226).
; PLAN: r0=174(x1), r1=123(y1), r2=57(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 123
LDI r2, 57
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
