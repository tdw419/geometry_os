; DESCRIPTION: Places a green line segment connecting (221, 227) to (10, 13).
; PLAN: r0=221(x1), r1=227(y1), r2=10(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 227
LDI r2, 10
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
