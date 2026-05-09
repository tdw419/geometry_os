; DESCRIPTION: Places a yellow line segment connecting (225, 118) to (177, 96).
; PLAN: r0=225(x1), r1=118(y1), r2=177(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 118
LDI r2, 177
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
