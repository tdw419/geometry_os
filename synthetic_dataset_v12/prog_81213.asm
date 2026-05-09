; DESCRIPTION: Places a white line segment connecting (145, 58) to (299, 97).
; PLAN: r0=145(x1), r1=58(y1), r2=299(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 58
LDI r2, 299
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
