; DESCRIPTION: Places a green line segment connecting (378, 181) to (329, 124).
; PLAN: r0=378(x1), r1=181(y1), r2=329(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 181
LDI r2, 329
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
