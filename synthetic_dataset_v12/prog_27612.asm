; DESCRIPTION: Places a white line segment connecting (427, 86) to (430, 221).
; PLAN: r0=427(x1), r1=86(y1), r2=430(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 86
LDI r2, 430
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
