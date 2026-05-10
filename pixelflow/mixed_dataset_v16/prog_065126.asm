; DESCRIPTION: Places a blue line segment connecting (325, 47) to (277, 92).
; PLAN: r0=325(x1), r1=47(y1), r2=277(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 47
LDI r2, 277
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
