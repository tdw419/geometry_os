; DESCRIPTION: Renders a blue line between points (456, 153) and (458, 203).
; PLAN: r0=456(x1), r1=153(y1), r2=458(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 153
LDI r2, 458
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
