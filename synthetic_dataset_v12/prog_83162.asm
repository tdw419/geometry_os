; DESCRIPTION: Places a white line segment connecting (301, 196) to (390, 211).
; PLAN: r0=301(x1), r1=196(y1), r2=390(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 196
LDI r2, 390
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
