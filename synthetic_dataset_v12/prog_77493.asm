; DESCRIPTION: Places a green line segment connecting (354, 13) to (500, 233).
; PLAN: r0=354(x1), r1=13(y1), r2=500(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 13
LDI r2, 500
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
