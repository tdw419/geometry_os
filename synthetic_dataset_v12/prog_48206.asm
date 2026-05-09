; DESCRIPTION: Renders a blue line between points (472, 49) and (504, 160).
; PLAN: r0=472(x1), r1=49(y1), r2=504(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 49
LDI r2, 504
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
