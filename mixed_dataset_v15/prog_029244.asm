; DESCRIPTION: Places a yellow line segment connecting (211, 234) to (422, 124).
; PLAN: r0=211(x1), r1=234(y1), r2=422(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 234
LDI r2, 422
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
