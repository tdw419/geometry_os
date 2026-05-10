; DESCRIPTION: Renders a orange line between points (45, 83) and (276, 18).
; PLAN: r0=45(x1), r1=83(y1), r2=276(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 83
LDI r2, 276
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
