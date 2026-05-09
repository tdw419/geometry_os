; DESCRIPTION: Places a yellow line segment connecting (432, 197) to (10, 162).
; PLAN: r0=432(x1), r1=197(y1), r2=10(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 197
LDI r2, 10
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
