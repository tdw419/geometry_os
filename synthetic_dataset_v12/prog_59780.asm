; DESCRIPTION: Renders a blue line between points (359, 209) and (370, 185).
; PLAN: r0=359(x1), r1=209(y1), r2=370(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 209
LDI r2, 370
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
