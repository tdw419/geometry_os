; DESCRIPTION: Renders a blue line between points (22, 178) and (458, 170).
; PLAN: r0=22(x1), r1=178(y1), r2=458(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 178
LDI r2, 458
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
