; DESCRIPTION: Renders a purple line between points (69, 40) and (490, 160).
; PLAN: r0=69(x1), r1=40(y1), r2=490(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 40
LDI r2, 490
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
