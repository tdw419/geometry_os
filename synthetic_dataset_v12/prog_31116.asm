; DESCRIPTION: Places a yellow line segment connecting (366, 118) to (106, 253).
; PLAN: r0=366(x1), r1=118(y1), r2=106(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 118
LDI r2, 106
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
