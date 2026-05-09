; DESCRIPTION: Renders a yellow line between points (216, 185) and (195, 168).
; PLAN: r0=216(x1), r1=185(y1), r2=195(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 185
LDI r2, 195
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
