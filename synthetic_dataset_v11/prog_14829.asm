; DESCRIPTION: Renders a orange line between points (144, 18) and (199, 87).
; PLAN: r0=144(x1), r1=18(y1), r2=199(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 18
LDI r2, 199
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
