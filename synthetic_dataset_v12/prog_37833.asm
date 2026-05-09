; DESCRIPTION: Places a white line segment connecting (418, 21) to (124, 58).
; PLAN: r0=418(x1), r1=21(y1), r2=124(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 21
LDI r2, 124
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
