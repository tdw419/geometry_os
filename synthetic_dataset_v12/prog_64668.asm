; DESCRIPTION: Places a orange line segment connecting (275, 241) to (45, 225).
; PLAN: r0=275(x1), r1=241(y1), r2=45(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 241
LDI r2, 45
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
