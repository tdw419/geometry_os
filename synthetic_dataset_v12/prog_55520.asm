; DESCRIPTION: Places a blue line segment connecting (190, 203) to (262, 58).
; PLAN: r0=190(x1), r1=203(y1), r2=262(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 203
LDI r2, 262
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
