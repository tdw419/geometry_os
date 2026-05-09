; DESCRIPTION: Places a orange line segment connecting (267, 19) to (70, 33).
; PLAN: r0=267(x1), r1=19(y1), r2=70(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 19
LDI r2, 70
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
