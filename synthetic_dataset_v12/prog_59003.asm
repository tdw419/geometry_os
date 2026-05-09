; DESCRIPTION: Renders a orange line between points (356, 218) and (134, 239).
; PLAN: r0=356(x1), r1=218(y1), r2=134(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 218
LDI r2, 134
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
