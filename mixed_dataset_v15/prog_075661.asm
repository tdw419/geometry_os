; DESCRIPTION: Places a black line segment connecting (330, 171) to (201, 33).
; PLAN: r0=330(x1), r1=171(y1), r2=201(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 171
LDI r2, 201
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
