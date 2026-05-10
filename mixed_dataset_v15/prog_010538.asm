; DESCRIPTION: Renders a orange line between points (325, 28) and (364, 15).
; PLAN: r0=325(x1), r1=28(y1), r2=364(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 28
LDI r2, 364
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
