; DESCRIPTION: Renders a blue line between points (137, 59) and (489, 120).
; PLAN: r0=137(x1), r1=59(y1), r2=489(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 59
LDI r2, 489
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
