; DESCRIPTION: Places a yellow line segment connecting (123, 10) to (351, 234).
; PLAN: r0=123(x1), r1=10(y1), r2=351(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 10
LDI r2, 351
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
