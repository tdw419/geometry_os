; DESCRIPTION: Places a white line segment connecting (97, 178) to (331, 160).
; PLAN: r0=97(x1), r1=178(y1), r2=331(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 178
LDI r2, 331
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
