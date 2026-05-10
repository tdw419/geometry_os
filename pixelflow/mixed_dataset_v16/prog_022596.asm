; DESCRIPTION: Places a yellow line segment connecting (351, 148) to (153, 161).
; PLAN: r0=351(x1), r1=148(y1), r2=153(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 148
LDI r2, 153
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
