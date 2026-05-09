; DESCRIPTION: Places a yellow line segment connecting (7, 226) to (137, 32).
; PLAN: r0=7(x1), r1=226(y1), r2=137(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 226
LDI r2, 137
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
