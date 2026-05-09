; DESCRIPTION: Places a blue line segment connecting (453, 160) to (142, 210).
; PLAN: r0=453(x1), r1=160(y1), r2=142(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 160
LDI r2, 142
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
