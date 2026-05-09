; DESCRIPTION: Renders a blue line between points (287, 91) and (218, 216).
; PLAN: r0=287(x1), r1=91(y1), r2=218(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 91
LDI r2, 218
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
