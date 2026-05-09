; DESCRIPTION: Renders a purple line between points (204, 220) and (249, 175).
; PLAN: r0=204(x1), r1=220(y1), r2=249(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 220
LDI r2, 249
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
