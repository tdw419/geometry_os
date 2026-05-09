; DESCRIPTION: Places a yellow line segment connecting (209, 254) to (472, 31).
; PLAN: r0=209(x1), r1=254(y1), r2=472(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 254
LDI r2, 472
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
