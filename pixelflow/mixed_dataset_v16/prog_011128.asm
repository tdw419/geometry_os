; DESCRIPTION: Places a blue line segment connecting (440, 34) to (356, 208).
; PLAN: r0=440(x1), r1=34(y1), r2=356(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 34
LDI r2, 356
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
