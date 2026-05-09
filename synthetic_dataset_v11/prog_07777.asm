; DESCRIPTION: Places a blue line segment connecting (60, 131) to (226, 203).
; PLAN: r0=60(x1), r1=131(y1), r2=226(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 131
LDI r2, 226
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
