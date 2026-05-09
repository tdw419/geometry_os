; DESCRIPTION: Places a blue line segment connecting (1, 234) to (170, 16).
; PLAN: r0=1(x1), r1=234(y1), r2=170(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 234
LDI r2, 170
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
