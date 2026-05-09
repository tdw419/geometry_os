; DESCRIPTION: Places a orange line segment connecting (266, 211) to (28, 240).
; PLAN: r0=266(x1), r1=211(y1), r2=28(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 211
LDI r2, 28
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
