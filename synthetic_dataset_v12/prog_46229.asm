; DESCRIPTION: Renders a orange line between points (368, 225) and (68, 235).
; PLAN: r0=368(x1), r1=225(y1), r2=68(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 225
LDI r2, 68
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
