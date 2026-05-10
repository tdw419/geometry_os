; DESCRIPTION: Renders a blue line between points (10, 72) and (423, 74).
; PLAN: r0=10(x1), r1=72(y1), r2=423(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 72
LDI r2, 423
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
