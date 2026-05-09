; DESCRIPTION: Places a yellow line segment connecting (161, 211) to (145, 131).
; PLAN: r0=161(x1), r1=211(y1), r2=145(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 211
LDI r2, 145
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
