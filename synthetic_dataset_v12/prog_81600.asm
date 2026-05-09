; DESCRIPTION: Places a white line segment connecting (316, 33) to (428, 160).
; PLAN: r0=316(x1), r1=33(y1), r2=428(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 33
LDI r2, 428
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
