; DESCRIPTION: Renders a purple line between points (207, 139) and (22, 207).
; PLAN: r0=207(x1), r1=139(y1), r2=22(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 139
LDI r2, 22
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
