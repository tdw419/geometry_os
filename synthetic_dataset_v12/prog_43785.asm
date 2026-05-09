; DESCRIPTION: Places a yellow line segment connecting (325, 37) to (283, 101).
; PLAN: r0=325(x1), r1=37(y1), r2=283(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 37
LDI r2, 283
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
