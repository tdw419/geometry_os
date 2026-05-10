; DESCRIPTION: Renders a red line segment connecting (130, 25) to (314, 104).
; PLAN: r0=130(x1), r1=25(y1), r2=314(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 25
LDI r2, 314
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
