; DESCRIPTION: Places a orange line segment connecting (199, 60) to (213, 251).
; PLAN: r0=199(x1), r1=60(y1), r2=213(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 60
LDI r2, 213
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
