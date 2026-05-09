; DESCRIPTION: Places a blue line segment connecting (331, 165) to (342, 46).
; PLAN: r0=331(x1), r1=165(y1), r2=342(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 165
LDI r2, 342
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
