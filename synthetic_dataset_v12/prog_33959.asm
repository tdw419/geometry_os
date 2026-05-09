; DESCRIPTION: Places a white line segment connecting (163, 91) to (26, 178).
; PLAN: r0=163(x1), r1=91(y1), r2=26(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 91
LDI r2, 26
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
