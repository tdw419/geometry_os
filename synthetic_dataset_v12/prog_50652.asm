; DESCRIPTION: Places a white line segment connecting (131, 145) to (287, 56).
; PLAN: r0=131(x1), r1=145(y1), r2=287(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 145
LDI r2, 287
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
