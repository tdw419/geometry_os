; DESCRIPTION: Renders a orange line between points (56, 34) and (303, 235).
; PLAN: r0=56(x1), r1=34(y1), r2=303(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 34
LDI r2, 303
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
