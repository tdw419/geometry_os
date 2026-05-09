; DESCRIPTION: Renders a orange line between points (510, 75) and (235, 2).
; PLAN: r0=510(x1), r1=75(y1), r2=235(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 75
LDI r2, 235
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
