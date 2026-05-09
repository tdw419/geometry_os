; DESCRIPTION: Places a yellow line segment connecting (150, 119) to (102, 59).
; PLAN: r0=150(x1), r1=119(y1), r2=102(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 119
LDI r2, 102
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
