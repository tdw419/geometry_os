; DESCRIPTION: Places a orange line segment connecting (391, 196) to (441, 161).
; PLAN: r0=391(x1), r1=196(y1), r2=441(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 196
LDI r2, 441
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
