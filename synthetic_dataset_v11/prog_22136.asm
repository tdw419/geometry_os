; DESCRIPTION: Places a yellow line segment connecting (59, 11) to (251, 168).
; PLAN: r0=59(x1), r1=11(y1), r2=251(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 11
LDI r2, 251
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
