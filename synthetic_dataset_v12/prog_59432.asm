; DESCRIPTION: Places a orange line segment connecting (316, 27) to (77, 226).
; PLAN: r0=316(x1), r1=27(y1), r2=77(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 27
LDI r2, 77
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
