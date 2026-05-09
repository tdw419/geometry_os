; DESCRIPTION: Renders a blue line between points (489, 219) and (150, 43).
; PLAN: r0=489(x1), r1=219(y1), r2=150(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 219
LDI r2, 150
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
