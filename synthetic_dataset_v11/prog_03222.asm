; DESCRIPTION: Places a green line segment connecting (207, 11) to (105, 17).
; PLAN: r0=207(x1), r1=11(y1), r2=105(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 11
LDI r2, 105
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
