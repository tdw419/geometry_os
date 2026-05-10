; DESCRIPTION: Renders a blue line between points (282, 181) and (229, 124).
; PLAN: r0=282(x1), r1=181(y1), r2=229(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 181
LDI r2, 229
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
