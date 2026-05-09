; DESCRIPTION: Places a orange line segment connecting (140, 247) to (75, 230).
; PLAN: r0=140(x1), r1=247(y1), r2=75(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 247
LDI r2, 75
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
