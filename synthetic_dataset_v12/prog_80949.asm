; DESCRIPTION: Renders a orange line between points (283, 134) and (254, 253).
; PLAN: r0=283(x1), r1=134(y1), r2=254(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 134
LDI r2, 254
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
