; DESCRIPTION: Places a yellow line segment connecting (405, 2) to (40, 162).
; PLAN: r0=405(x1), r1=2(y1), r2=40(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 2
LDI r2, 40
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
