; DESCRIPTION: Places a blue line segment connecting (489, 27) to (133, 180).
; PLAN: r0=489(x1), r1=27(y1), r2=133(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 27
LDI r2, 133
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
