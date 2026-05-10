; DESCRIPTION: Places a yellow line segment connecting (137, 226) to (339, 82).
; PLAN: r0=137(x1), r1=226(y1), r2=339(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 226
LDI r2, 339
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
