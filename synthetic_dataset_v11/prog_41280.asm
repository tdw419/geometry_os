; DESCRIPTION: Places a white line segment connecting (9, 234) to (163, 82).
; PLAN: r0=9(x1), r1=234(y1), r2=163(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 234
LDI r2, 163
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
