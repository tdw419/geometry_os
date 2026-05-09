; DESCRIPTION: Renders a blue line between points (35, 180) and (63, 251).
; PLAN: r0=35(x1), r1=180(y1), r2=63(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 180
LDI r2, 63
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
