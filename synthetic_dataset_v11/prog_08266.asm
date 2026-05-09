; DESCRIPTION: Renders a orange line between points (66, 54) and (235, 102).
; PLAN: r0=66(x1), r1=54(y1), r2=235(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 54
LDI r2, 235
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
