; DESCRIPTION: Places a yellow line segment connecting (510, 162) to (181, 85).
; PLAN: r0=510(x1), r1=162(y1), r2=181(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 162
LDI r2, 181
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
