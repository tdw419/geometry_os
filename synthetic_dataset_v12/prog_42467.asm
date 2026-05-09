; DESCRIPTION: Renders a blue line between points (423, 40) and (120, 188).
; PLAN: r0=423(x1), r1=40(y1), r2=120(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 40
LDI r2, 120
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
