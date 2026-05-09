; DESCRIPTION: Places a green line segment connecting (92, 254) to (40, 129).
; PLAN: r0=92(x1), r1=254(y1), r2=40(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 254
LDI r2, 40
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
