; DESCRIPTION: Places a green line segment connecting (337, 186) to (390, 33).
; PLAN: r0=337(x1), r1=186(y1), r2=390(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 186
LDI r2, 390
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
