; DESCRIPTION: Renders a purple line between points (216, 62) and (171, 115).
; PLAN: r0=216(x1), r1=62(y1), r2=171(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 62
LDI r2, 171
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
