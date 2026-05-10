; DESCRIPTION: Renders a orange line between points (252, 132) and (342, 235).
; PLAN: r0=252(x1), r1=132(y1), r2=342(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 132
LDI r2, 342
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
