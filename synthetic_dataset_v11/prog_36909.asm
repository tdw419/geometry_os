; DESCRIPTION: Places a yellow line segment connecting (124, 13) to (148, 142).
; PLAN: r0=124(x1), r1=13(y1), r2=148(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 13
LDI r2, 148
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
