; DESCRIPTION: Places a yellow line segment connecting (163, 193) to (75, 38).
; PLAN: r0=163(x1), r1=193(y1), r2=75(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 193
LDI r2, 75
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
