; DESCRIPTION: Renders a orange line between points (252, 251) and (235, 190).
; PLAN: r0=252(x1), r1=251(y1), r2=235(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 251
LDI r2, 235
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
