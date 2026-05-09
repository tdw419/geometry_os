; DESCRIPTION: Places a yellow line segment connecting (132, 187) to (21, 102).
; PLAN: r0=132(x1), r1=187(y1), r2=21(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 187
LDI r2, 21
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
