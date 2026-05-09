; DESCRIPTION: Places a yellow line segment connecting (159, 2) to (283, 178).
; PLAN: r0=159(x1), r1=2(y1), r2=283(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 2
LDI r2, 283
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
