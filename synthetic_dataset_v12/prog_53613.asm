; DESCRIPTION: Places a yellow line segment connecting (21, 218) to (193, 230).
; PLAN: r0=21(x1), r1=218(y1), r2=193(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 218
LDI r2, 193
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
