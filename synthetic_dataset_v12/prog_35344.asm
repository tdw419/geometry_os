; DESCRIPTION: Places a orange line segment connecting (373, 150) to (189, 226).
; PLAN: r0=373(x1), r1=150(y1), r2=189(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 150
LDI r2, 189
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
