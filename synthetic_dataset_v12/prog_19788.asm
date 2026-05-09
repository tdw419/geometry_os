; DESCRIPTION: Renders a blue line between points (190, 155) and (305, 254).
; PLAN: r0=190(x1), r1=155(y1), r2=305(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 155
LDI r2, 305
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
