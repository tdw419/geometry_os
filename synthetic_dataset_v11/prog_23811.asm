; DESCRIPTION: Places a green line segment connecting (207, 203) to (89, 187).
; PLAN: r0=207(x1), r1=203(y1), r2=89(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 203
LDI r2, 89
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
