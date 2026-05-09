; DESCRIPTION: Places a blue line segment connecting (47, 72) to (356, 188).
; PLAN: r0=47(x1), r1=72(y1), r2=356(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 72
LDI r2, 356
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
