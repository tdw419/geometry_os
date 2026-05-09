; DESCRIPTION: Renders a blue line between points (17, 50) and (87, 163).
; PLAN: r0=17(x1), r1=50(y1), r2=87(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 50
LDI r2, 87
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
