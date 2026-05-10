; DESCRIPTION: Renders a orange line between points (99, 107) and (211, 176).
; PLAN: r0=99(x1), r1=107(y1), r2=211(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 107
LDI r2, 211
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
