; DESCRIPTION: Places a orange line segment connecting (235, 77) to (24, 127).
; PLAN: r0=235(x1), r1=77(y1), r2=24(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 77
LDI r2, 24
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
