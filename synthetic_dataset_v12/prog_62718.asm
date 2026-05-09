; DESCRIPTION: Renders a blue line between points (283, 96) and (489, 43).
; PLAN: r0=283(x1), r1=96(y1), r2=489(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 96
LDI r2, 489
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
