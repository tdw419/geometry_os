; DESCRIPTION: Places a yellow line segment connecting (392, 241) to (44, 118).
; PLAN: r0=392(x1), r1=241(y1), r2=44(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 241
LDI r2, 44
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
