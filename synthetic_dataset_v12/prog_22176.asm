; DESCRIPTION: Places a orange line segment connecting (27, 85) to (372, 165).
; PLAN: r0=27(x1), r1=85(y1), r2=372(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 85
LDI r2, 372
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
