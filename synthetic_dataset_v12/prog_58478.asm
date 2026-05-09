; DESCRIPTION: Places a yellow line segment connecting (206, 108) to (378, 105).
; PLAN: r0=206(x1), r1=108(y1), r2=378(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 108
LDI r2, 378
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
