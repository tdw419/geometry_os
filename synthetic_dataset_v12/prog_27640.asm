; DESCRIPTION: Places a white line segment connecting (94, 0) to (414, 98).
; PLAN: r0=94(x1), r1=0(y1), r2=414(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 0
LDI r2, 414
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
