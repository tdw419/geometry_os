; DESCRIPTION: Renders a purple line between points (174, 111) and (216, 7).
; PLAN: r0=174(x1), r1=111(y1), r2=216(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 111
LDI r2, 216
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
