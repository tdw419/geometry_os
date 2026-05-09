; DESCRIPTION: Renders a blue line between points (7, 83) and (110, 14).
; PLAN: r0=7(x1), r1=83(y1), r2=110(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 83
LDI r2, 110
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
