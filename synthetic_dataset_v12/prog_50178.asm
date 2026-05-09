; DESCRIPTION: Places a blue line segment connecting (431, 230) to (277, 60).
; PLAN: r0=431(x1), r1=230(y1), r2=277(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 230
LDI r2, 277
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
