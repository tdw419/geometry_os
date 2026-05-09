; DESCRIPTION: Places a green line segment connecting (447, 28) to (86, 162).
; PLAN: r0=447(x1), r1=28(y1), r2=86(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 28
LDI r2, 86
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
