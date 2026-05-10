; DESCRIPTION: Places a yellow line segment connecting (285, 2) to (430, 44).
; PLAN: r0=285(x1), r1=2(y1), r2=430(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 2
LDI r2, 430
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
