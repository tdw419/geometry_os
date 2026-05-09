; DESCRIPTION: Renders a orange line between points (43, 76) and (235, 48).
; PLAN: r0=43(x1), r1=76(y1), r2=235(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 76
LDI r2, 235
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
