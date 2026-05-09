; DESCRIPTION: Renders a blue line between points (227, 8) and (143, 93).
; PLAN: r0=227(x1), r1=8(y1), r2=143(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 8
LDI r2, 143
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
