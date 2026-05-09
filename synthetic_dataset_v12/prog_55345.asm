; DESCRIPTION: Places a blue line segment connecting (277, 217) to (482, 193).
; PLAN: r0=277(x1), r1=217(y1), r2=482(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 217
LDI r2, 482
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
