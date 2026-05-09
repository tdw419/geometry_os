; DESCRIPTION: Renders a blue line between points (54, 207) and (45, 80).
; PLAN: r0=54(x1), r1=207(y1), r2=45(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 207
LDI r2, 45
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
