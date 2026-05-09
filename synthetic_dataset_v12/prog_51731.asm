; DESCRIPTION: Renders a purple line between points (50, 145) and (240, 136).
; PLAN: r0=50(x1), r1=145(y1), r2=240(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 145
LDI r2, 240
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
