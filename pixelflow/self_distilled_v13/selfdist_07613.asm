; DESCRIPTION: Renders a orange line segment connecting (323, 110) to (298, 45).
; PLAN: r0=323(x1), r1=110(y1), r2=298(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 110
LDI r2, 298
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
