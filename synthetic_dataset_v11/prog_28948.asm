; DESCRIPTION: Places a orange line segment connecting (9, 182) to (237, 8).
; PLAN: r0=9(x1), r1=182(y1), r2=237(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 182
LDI r2, 237
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
