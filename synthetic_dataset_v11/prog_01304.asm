; DESCRIPTION: Places a yellow line segment connecting (102, 61) to (208, 43).
; PLAN: r0=102(x1), r1=61(y1), r2=208(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 61
LDI r2, 208
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
