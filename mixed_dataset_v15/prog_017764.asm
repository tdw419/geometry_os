; DESCRIPTION: Places a orange line segment connecting (267, 148) to (290, 68).
; PLAN: r0=267(x1), r1=148(y1), r2=290(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 148
LDI r2, 290
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
