; DESCRIPTION: Renders a orange line between points (235, 3) and (471, 33).
; PLAN: r0=235(x1), r1=3(y1), r2=471(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 3
LDI r2, 471
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
