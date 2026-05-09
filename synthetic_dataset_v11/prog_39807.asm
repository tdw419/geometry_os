; DESCRIPTION: Places a yellow line segment connecting (115, 118) to (124, 55).
; PLAN: r0=115(x1), r1=118(y1), r2=124(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 118
LDI r2, 124
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
