; DESCRIPTION: Places a green line segment connecting (452, 161) to (130, 244).
; PLAN: r0=452(x1), r1=161(y1), r2=130(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 161
LDI r2, 130
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
