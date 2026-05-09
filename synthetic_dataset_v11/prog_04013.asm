; DESCRIPTION: Renders a blue line between points (36, 94) and (4, 244).
; PLAN: r0=36(x1), r1=94(y1), r2=4(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 94
LDI r2, 4
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
