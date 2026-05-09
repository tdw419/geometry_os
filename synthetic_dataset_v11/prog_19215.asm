; DESCRIPTION: Renders a purple line between points (193, 166) and (216, 81).
; PLAN: r0=193(x1), r1=166(y1), r2=216(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 166
LDI r2, 216
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
