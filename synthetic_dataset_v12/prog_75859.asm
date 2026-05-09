; DESCRIPTION: Places a yellow line segment connecting (390, 236) to (108, 33).
; PLAN: r0=390(x1), r1=236(y1), r2=108(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 236
LDI r2, 108
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
