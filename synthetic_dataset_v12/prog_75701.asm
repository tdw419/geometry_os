; DESCRIPTION: Places a yellow line segment connecting (91, 61) to (447, 165).
; PLAN: r0=91(x1), r1=61(y1), r2=447(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 61
LDI r2, 447
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
