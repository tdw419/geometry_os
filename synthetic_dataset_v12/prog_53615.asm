; DESCRIPTION: Renders a blue line between points (484, 127) and (355, 150).
; PLAN: r0=484(x1), r1=127(y1), r2=355(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 127
LDI r2, 355
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
