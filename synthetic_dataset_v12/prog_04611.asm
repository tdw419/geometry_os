; DESCRIPTION: Places a white line segment connecting (390, 39) to (511, 191).
; PLAN: r0=390(x1), r1=39(y1), r2=511(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 39
LDI r2, 511
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
