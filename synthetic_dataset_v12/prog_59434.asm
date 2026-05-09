; DESCRIPTION: Places a yellow line segment connecting (338, 61) to (372, 106).
; PLAN: r0=338(x1), r1=61(y1), r2=372(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 61
LDI r2, 372
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
