; DESCRIPTION: Renders a purple line between points (225, 64) and (132, 14).
; PLAN: r0=225(x1), r1=64(y1), r2=132(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 64
LDI r2, 132
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
