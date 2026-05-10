; DESCRIPTION: Places a green line segment connecting (459, 194) to (321, 123).
; PLAN: r0=459(x1), r1=194(y1), r2=321(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 194
LDI r2, 321
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
