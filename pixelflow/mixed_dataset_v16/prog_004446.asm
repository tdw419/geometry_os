; DESCRIPTION: Places a yellow line segment connecting (23, 136) to (423, 221).
; PLAN: r0=23(x1), r1=136(y1), r2=423(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 136
LDI r2, 423
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
