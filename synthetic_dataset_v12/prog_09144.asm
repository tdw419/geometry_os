; DESCRIPTION: Places a orange line segment connecting (274, 182) to (499, 211).
; PLAN: r0=274(x1), r1=182(y1), r2=499(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 182
LDI r2, 499
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
