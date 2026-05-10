; DESCRIPTION: Places a green line segment connecting (303, 75) to (211, 12).
; PLAN: r0=303(x1), r1=75(y1), r2=211(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 75
LDI r2, 211
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
