; DESCRIPTION: Renders a blue line between points (106, 200) and (12, 254).
; PLAN: r0=106(x1), r1=200(y1), r2=12(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 200
LDI r2, 12
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
