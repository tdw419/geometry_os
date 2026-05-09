; DESCRIPTION: Places a orange line segment connecting (140, 56) to (48, 235).
; PLAN: r0=140(x1), r1=56(y1), r2=48(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 56
LDI r2, 48
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
