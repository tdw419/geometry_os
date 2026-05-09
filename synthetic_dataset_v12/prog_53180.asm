; DESCRIPTION: Places a white line segment connecting (201, 165) to (391, 68).
; PLAN: r0=201(x1), r1=165(y1), r2=391(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 165
LDI r2, 391
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
