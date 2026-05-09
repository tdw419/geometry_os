; DESCRIPTION: Renders a orange line between points (311, 201) and (492, 5).
; PLAN: r0=311(x1), r1=201(y1), r2=492(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 201
LDI r2, 492
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
