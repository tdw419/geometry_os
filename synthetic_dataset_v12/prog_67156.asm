; DESCRIPTION: Renders a blue line between points (448, 123) and (54, 126).
; PLAN: r0=448(x1), r1=123(y1), r2=54(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 123
LDI r2, 54
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
