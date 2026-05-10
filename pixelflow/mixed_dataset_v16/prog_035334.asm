; DESCRIPTION: Places a blue line segment connecting (460, 193) to (419, 131).
; PLAN: r0=460(x1), r1=193(y1), r2=419(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 193
LDI r2, 419
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
