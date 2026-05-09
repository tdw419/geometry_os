; DESCRIPTION: Renders a blue line between points (472, 34) and (329, 34).
; PLAN: r0=472(x1), r1=34(y1), r2=329(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 34
LDI r2, 329
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
