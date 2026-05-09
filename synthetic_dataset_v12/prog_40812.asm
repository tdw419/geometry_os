; DESCRIPTION: Places a green line segment connecting (409, 56) to (130, 37).
; PLAN: r0=409(x1), r1=56(y1), r2=130(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 56
LDI r2, 130
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
