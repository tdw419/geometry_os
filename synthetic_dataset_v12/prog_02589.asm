; DESCRIPTION: Renders a blue line between points (482, 74) and (269, 110).
; PLAN: r0=482(x1), r1=74(y1), r2=269(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 74
LDI r2, 269
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
