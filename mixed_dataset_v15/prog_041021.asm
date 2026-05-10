; DESCRIPTION: Places a green line segment connecting (459, 77) to (302, 181).
; PLAN: r0=459(x1), r1=77(y1), r2=302(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 77
LDI r2, 302
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
