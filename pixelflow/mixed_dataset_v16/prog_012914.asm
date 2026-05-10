; DESCRIPTION: Places a blue line segment connecting (270, 66) to (234, 200).
; PLAN: r0=270(x1), r1=66(y1), r2=234(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 66
LDI r2, 234
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
