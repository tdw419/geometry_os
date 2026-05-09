; DESCRIPTION: Renders a purple line between points (215, 110) and (454, 114).
; PLAN: r0=215(x1), r1=110(y1), r2=454(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 110
LDI r2, 454
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
