; DESCRIPTION: Renders a purple line between points (65, 90) and (54, 226).
; PLAN: r0=65(x1), r1=90(y1), r2=54(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 90
LDI r2, 54
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
