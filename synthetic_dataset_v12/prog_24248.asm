; DESCRIPTION: Renders a blue line between points (162, 197) and (62, 254).
; PLAN: r0=162(x1), r1=197(y1), r2=62(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 197
LDI r2, 62
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
