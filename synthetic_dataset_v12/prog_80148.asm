; DESCRIPTION: Places a yellow line segment connecting (58, 118) to (273, 193).
; PLAN: r0=58(x1), r1=118(y1), r2=273(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 118
LDI r2, 273
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
