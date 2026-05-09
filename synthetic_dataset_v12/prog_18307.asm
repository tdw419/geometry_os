; DESCRIPTION: Renders a orange line between points (118, 173) and (37, 235).
; PLAN: r0=118(x1), r1=173(y1), r2=37(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 173
LDI r2, 37
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
