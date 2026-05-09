; DESCRIPTION: Renders a purple line between points (215, 40) and (83, 22).
; PLAN: r0=215(x1), r1=40(y1), r2=83(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 40
LDI r2, 83
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
