; DESCRIPTION: Renders a blue line between points (461, 60) and (353, 14).
; PLAN: r0=461(x1), r1=60(y1), r2=353(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 60
LDI r2, 353
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
