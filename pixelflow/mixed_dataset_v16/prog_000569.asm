; DESCRIPTION: Places a orange line segment connecting (193, 235) to (319, 38).
; PLAN: r0=193(x1), r1=235(y1), r2=319(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 235
LDI r2, 319
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
