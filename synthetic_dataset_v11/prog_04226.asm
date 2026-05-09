; DESCRIPTION: Places a yellow line segment connecting (3, 145) to (117, 108).
; PLAN: r0=3(x1), r1=145(y1), r2=117(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 145
LDI r2, 117
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
