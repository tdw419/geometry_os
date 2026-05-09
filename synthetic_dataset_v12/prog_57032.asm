; DESCRIPTION: Renders a orange line between points (94, 208) and (469, 245).
; PLAN: r0=94(x1), r1=208(y1), r2=469(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 208
LDI r2, 469
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
