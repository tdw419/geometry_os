; DESCRIPTION: Renders a blue line between points (139, 251) and (345, 227).
; PLAN: r0=139(x1), r1=251(y1), r2=345(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 251
LDI r2, 345
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
