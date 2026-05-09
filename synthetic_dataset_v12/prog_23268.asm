; DESCRIPTION: Renders a blue line between points (458, 44) and (193, 116).
; PLAN: r0=458(x1), r1=44(y1), r2=193(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 44
LDI r2, 193
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
