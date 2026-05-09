; DESCRIPTION: Places a orange line segment connecting (268, 235) to (459, 86).
; PLAN: r0=268(x1), r1=235(y1), r2=459(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 235
LDI r2, 459
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
