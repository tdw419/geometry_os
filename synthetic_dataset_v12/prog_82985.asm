; DESCRIPTION: Places a purple line segment connecting (250, 175) to (254, 193).
; PLAN: r0=250(x1), r1=175(y1), r2=254(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 175
LDI r2, 254
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
