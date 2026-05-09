; DESCRIPTION: Renders a blue line between points (10, 84) and (208, 180).
; PLAN: r0=10(x1), r1=84(y1), r2=208(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 84
LDI r2, 208
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
