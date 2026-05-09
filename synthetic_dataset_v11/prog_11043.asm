; DESCRIPTION: Places a blue line segment connecting (96, 131) to (214, 114).
; PLAN: r0=96(x1), r1=131(y1), r2=214(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 131
LDI r2, 214
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
