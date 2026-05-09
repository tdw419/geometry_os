; DESCRIPTION: Places a yellow line segment connecting (61, 252) to (185, 59).
; PLAN: r0=61(x1), r1=252(y1), r2=185(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 252
LDI r2, 185
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
