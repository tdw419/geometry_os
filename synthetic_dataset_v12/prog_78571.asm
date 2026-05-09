; DESCRIPTION: Places a orange line segment connecting (68, 174) to (267, 180).
; PLAN: r0=68(x1), r1=174(y1), r2=267(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 174
LDI r2, 267
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
