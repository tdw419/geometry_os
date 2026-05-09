; DESCRIPTION: Places a yellow line segment connecting (430, 159) to (259, 3).
; PLAN: r0=430(x1), r1=159(y1), r2=259(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 159
LDI r2, 259
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
