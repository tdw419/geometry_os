; DESCRIPTION: Renders a blue line between points (9, 14) and (232, 50).
; PLAN: r0=9(x1), r1=14(y1), r2=232(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 14
LDI r2, 232
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
