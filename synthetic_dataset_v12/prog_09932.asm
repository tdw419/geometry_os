; DESCRIPTION: Places a white line segment connecting (407, 156) to (401, 97).
; PLAN: r0=407(x1), r1=156(y1), r2=401(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 156
LDI r2, 401
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
