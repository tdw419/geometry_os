; DESCRIPTION: Places a blue line segment connecting (386, 185) to (454, 234).
; PLAN: r0=386(x1), r1=185(y1), r2=454(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 185
LDI r2, 454
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
