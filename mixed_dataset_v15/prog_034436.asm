; DESCRIPTION: Places a white line segment connecting (44, 183) to (428, 201).
; PLAN: r0=44(x1), r1=183(y1), r2=428(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 183
LDI r2, 428
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
