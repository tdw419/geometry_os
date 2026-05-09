; DESCRIPTION: Renders a blue line between points (166, 181) and (54, 145).
; PLAN: r0=166(x1), r1=181(y1), r2=54(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 181
LDI r2, 54
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
