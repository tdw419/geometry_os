; DESCRIPTION: Places a white line segment connecting (181, 234) to (13, 129).
; PLAN: r0=181(x1), r1=234(y1), r2=13(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 234
LDI r2, 13
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
