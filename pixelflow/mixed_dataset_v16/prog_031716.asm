; DESCRIPTION: Places a orange line segment connecting (425, 103) to (114, 112).
; PLAN: r0=425(x1), r1=103(y1), r2=114(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 103
LDI r2, 114
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
