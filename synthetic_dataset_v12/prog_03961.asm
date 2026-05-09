; DESCRIPTION: Renders a purple line between points (225, 1) and (84, 70).
; PLAN: r0=225(x1), r1=1(y1), r2=84(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 1
LDI r2, 84
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
