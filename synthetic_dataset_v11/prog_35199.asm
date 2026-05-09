; DESCRIPTION: Renders a purple line between points (162, 126) and (225, 204).
; PLAN: r0=162(x1), r1=126(y1), r2=225(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 126
LDI r2, 225
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
