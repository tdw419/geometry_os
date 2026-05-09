; DESCRIPTION: Renders a blue line between points (489, 9) and (193, 62).
; PLAN: r0=489(x1), r1=9(y1), r2=193(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 9
LDI r2, 193
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
