; DESCRIPTION: Renders a purple line between points (385, 12) and (495, 87).
; PLAN: r0=385(x1), r1=12(y1), r2=495(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 12
LDI r2, 495
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
