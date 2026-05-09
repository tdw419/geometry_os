; DESCRIPTION: Places a orange line segment connecting (275, 210) to (78, 253).
; PLAN: r0=275(x1), r1=210(y1), r2=78(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 210
LDI r2, 78
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
