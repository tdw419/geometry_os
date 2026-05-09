; DESCRIPTION: Places a orange line segment connecting (125, 94) to (18, 177).
; PLAN: r0=125(x1), r1=94(y1), r2=18(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 94
LDI r2, 18
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
