; DESCRIPTION: Places a yellow line segment connecting (92, 18) to (454, 189).
; PLAN: r0=92(x1), r1=18(y1), r2=454(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 18
LDI r2, 454
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
