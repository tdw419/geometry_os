; DESCRIPTION: Renders a orange line between points (178, 107) and (89, 15).
; PLAN: r0=178(x1), r1=107(y1), r2=89(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 107
LDI r2, 89
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
