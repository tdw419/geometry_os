; DESCRIPTION: Renders a blue line between points (155, 126) and (495, 193).
; PLAN: r0=155(x1), r1=126(y1), r2=495(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 126
LDI r2, 495
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
