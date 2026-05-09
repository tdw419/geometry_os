; DESCRIPTION: Renders a orange line between points (306, 235) and (170, 75).
; PLAN: r0=306(x1), r1=235(y1), r2=170(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 235
LDI r2, 170
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
