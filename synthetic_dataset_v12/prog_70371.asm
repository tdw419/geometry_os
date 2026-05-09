; DESCRIPTION: Renders a purple line between points (67, 216) and (465, 225).
; PLAN: r0=67(x1), r1=216(y1), r2=465(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 216
LDI r2, 465
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
