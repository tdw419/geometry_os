; DESCRIPTION: Places a green line segment connecting (211, 124) to (11, 181).
; PLAN: r0=211(x1), r1=124(y1), r2=11(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 124
LDI r2, 11
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
