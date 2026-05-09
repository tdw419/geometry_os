; DESCRIPTION: Places a orange line segment connecting (460, 208) to (79, 165).
; PLAN: r0=460(x1), r1=208(y1), r2=79(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 208
LDI r2, 79
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
