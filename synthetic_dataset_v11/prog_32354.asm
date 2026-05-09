; DESCRIPTION: Renders a blue line between points (75, 179) and (212, 133).
; PLAN: r0=75(x1), r1=179(y1), r2=212(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 179
LDI r2, 212
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
