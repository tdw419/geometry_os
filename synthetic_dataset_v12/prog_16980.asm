; DESCRIPTION: Places a red line segment connecting (122, 53) to (393, 130).
; PLAN: r0=122(x1), r1=53(y1), r2=393(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 53
LDI r2, 393
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
