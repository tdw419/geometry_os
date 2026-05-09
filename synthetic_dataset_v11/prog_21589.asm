; DESCRIPTION: Renders a blue line between points (145, 143) and (81, 139).
; PLAN: r0=145(x1), r1=143(y1), r2=81(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 143
LDI r2, 81
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
