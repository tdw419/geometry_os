; DESCRIPTION: Renders a orange line between points (342, 97) and (26, 44).
; PLAN: r0=342(x1), r1=97(y1), r2=26(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 97
LDI r2, 26
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
