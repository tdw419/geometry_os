; DESCRIPTION: Places a yellow line segment connecting (164, 101) to (449, 59).
; PLAN: r0=164(x1), r1=101(y1), r2=449(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 101
LDI r2, 449
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
