; DESCRIPTION: Places a green line segment connecting (124, 38) to (289, 160).
; PLAN: r0=124(x1), r1=38(y1), r2=289(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 38
LDI r2, 289
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
