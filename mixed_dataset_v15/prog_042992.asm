; DESCRIPTION: Places a white line segment connecting (330, 170) to (325, 143).
; PLAN: r0=330(x1), r1=170(y1), r2=325(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 170
LDI r2, 325
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
