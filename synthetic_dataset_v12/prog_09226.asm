; DESCRIPTION: Renders a blue line between points (81, 20) and (458, 172).
; PLAN: r0=81(x1), r1=20(y1), r2=458(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 20
LDI r2, 458
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
