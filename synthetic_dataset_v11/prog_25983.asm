; DESCRIPTION: Renders a blue line between points (106, 249) and (142, 142).
; PLAN: r0=106(x1), r1=249(y1), r2=142(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 249
LDI r2, 142
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
