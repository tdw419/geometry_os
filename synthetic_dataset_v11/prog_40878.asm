; DESCRIPTION: Renders a orange line between points (83, 72) and (126, 254).
; PLAN: r0=83(x1), r1=72(y1), r2=126(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 72
LDI r2, 126
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
