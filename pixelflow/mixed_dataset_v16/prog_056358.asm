; DESCRIPTION: Places a yellow line segment connecting (91, 78) to (102, 186).
; PLAN: r0=91(x1), r1=78(y1), r2=102(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 78
LDI r2, 102
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
