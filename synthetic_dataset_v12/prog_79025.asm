; DESCRIPTION: Places a purple line segment connecting (418, 23) to (385, 29).
; PLAN: r0=418(x1), r1=23(y1), r2=385(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 23
LDI r2, 385
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
