; DESCRIPTION: Places a orange line segment connecting (177, 136) to (47, 94).
; PLAN: r0=177(x1), r1=136(y1), r2=47(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 136
LDI r2, 47
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
