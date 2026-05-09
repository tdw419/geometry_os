; DESCRIPTION: Places a black line segment connecting (314, 202) to (283, 142).
; PLAN: r0=314(x1), r1=202(y1), r2=283(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 202
LDI r2, 283
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
