; DESCRIPTION: Renders a blue line between points (70, 203) and (158, 131).
; PLAN: r0=70(x1), r1=203(y1), r2=158(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 203
LDI r2, 158
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
