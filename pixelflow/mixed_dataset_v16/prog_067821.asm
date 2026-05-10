; DESCRIPTION: Renders a blue line between points (458, 22) and (22, 57).
; PLAN: r0=458(x1), r1=22(y1), r2=22(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 22
LDI r2, 22
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
