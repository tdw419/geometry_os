; DESCRIPTION: Places a white line segment connecting (73, 211) to (508, 164).
; PLAN: r0=73(x1), r1=211(y1), r2=508(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 211
LDI r2, 508
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
