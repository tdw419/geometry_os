; DESCRIPTION: Renders a blue line between points (489, 79) and (474, 54).
; PLAN: r0=489(x1), r1=79(y1), r2=474(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 79
LDI r2, 474
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
