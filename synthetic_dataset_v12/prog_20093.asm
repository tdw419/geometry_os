; DESCRIPTION: Places a red line segment connecting (333, 37) to (47, 130).
; PLAN: r0=333(x1), r1=37(y1), r2=47(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 37
LDI r2, 47
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
