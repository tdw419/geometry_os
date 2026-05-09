; DESCRIPTION: Places a yellow line segment connecting (22, 192) to (241, 249).
; PLAN: r0=22(x1), r1=192(y1), r2=241(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 192
LDI r2, 241
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
