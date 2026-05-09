; DESCRIPTION: Places a blue line segment connecting (331, 35) to (300, 243).
; PLAN: r0=331(x1), r1=35(y1), r2=300(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 35
LDI r2, 300
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
