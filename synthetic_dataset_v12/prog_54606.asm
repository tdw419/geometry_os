; DESCRIPTION: Renders a blue line between points (181, 181) and (260, 45).
; PLAN: r0=181(x1), r1=181(y1), r2=260(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 181
LDI r2, 260
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
