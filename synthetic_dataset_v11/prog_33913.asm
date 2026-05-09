; DESCRIPTION: Renders a purple line between points (135, 211) and (117, 39).
; PLAN: r0=135(x1), r1=211(y1), r2=117(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 211
LDI r2, 117
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
