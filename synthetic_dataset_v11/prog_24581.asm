; DESCRIPTION: Renders a red line between points (83, 203) and (110, 110).
; PLAN: r0=83(x1), r1=203(y1), r2=110(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 203
LDI r2, 110
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
