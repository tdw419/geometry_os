; DESCRIPTION: Renders a orange line between points (169, 170) and (235, 193).
; PLAN: r0=169(x1), r1=170(y1), r2=235(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 170
LDI r2, 235
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
