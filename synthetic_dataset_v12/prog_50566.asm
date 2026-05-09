; DESCRIPTION: Places a yellow line segment connecting (355, 189) to (70, 186).
; PLAN: r0=355(x1), r1=189(y1), r2=70(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 189
LDI r2, 70
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
