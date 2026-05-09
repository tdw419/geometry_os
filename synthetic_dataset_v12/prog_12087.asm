; DESCRIPTION: Renders a blue line between points (339, 89) and (360, 33).
; PLAN: r0=339(x1), r1=89(y1), r2=360(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 89
LDI r2, 360
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
