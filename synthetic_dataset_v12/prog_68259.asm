; DESCRIPTION: Renders a blue line between points (237, 254) and (62, 68).
; PLAN: r0=237(x1), r1=254(y1), r2=62(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 254
LDI r2, 62
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
