; DESCRIPTION: Renders a blue line between points (343, 194) and (185, 169).
; PLAN: r0=343(x1), r1=194(y1), r2=185(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 194
LDI r2, 185
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
