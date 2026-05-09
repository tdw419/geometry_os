; DESCRIPTION: Places a white line segment connecting (205, 232) to (183, 234).
; PLAN: r0=205(x1), r1=232(y1), r2=183(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 232
LDI r2, 183
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
