; DESCRIPTION: Renders a blue line between points (211, 174) and (489, 33).
; PLAN: r0=211(x1), r1=174(y1), r2=489(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 174
LDI r2, 489
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
