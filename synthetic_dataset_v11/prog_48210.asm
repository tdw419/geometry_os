; DESCRIPTION: Renders a orange line between points (199, 150) and (203, 87).
; PLAN: r0=199(x1), r1=150(y1), r2=203(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 150
LDI r2, 203
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
