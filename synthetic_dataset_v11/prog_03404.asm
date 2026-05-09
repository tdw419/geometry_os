; DESCRIPTION: Places a yellow line segment connecting (148, 9) to (149, 221).
; PLAN: r0=148(x1), r1=9(y1), r2=149(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 9
LDI r2, 149
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
