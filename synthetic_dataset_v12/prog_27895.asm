; DESCRIPTION: Renders a blue line between points (149, 15) and (33, 190).
; PLAN: r0=149(x1), r1=15(y1), r2=33(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 15
LDI r2, 33
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
