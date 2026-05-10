; DESCRIPTION: Places a red line segment connecting (204, 25) to (12, 130).
; PLAN: r0=204(x1), r1=25(y1), r2=12(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 25
LDI r2, 12
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
