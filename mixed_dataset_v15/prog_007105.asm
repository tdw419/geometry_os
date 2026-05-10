; DESCRIPTION: Places a white line segment connecting (428, 193) to (508, 30).
; PLAN: r0=428(x1), r1=193(y1), r2=508(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 193
LDI r2, 508
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
