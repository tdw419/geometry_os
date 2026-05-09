; DESCRIPTION: Places a yellow line segment connecting (189, 25) to (225, 61).
; PLAN: r0=189(x1), r1=25(y1), r2=225(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 25
LDI r2, 225
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
