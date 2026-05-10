; DESCRIPTION: Places a orange line segment connecting (275, 189) to (267, 20).
; PLAN: r0=275(x1), r1=189(y1), r2=267(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 189
LDI r2, 267
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
