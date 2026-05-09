; DESCRIPTION: Renders a purple line between points (188, 217) and (146, 33).
; PLAN: r0=188(x1), r1=217(y1), r2=146(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 217
LDI r2, 146
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
