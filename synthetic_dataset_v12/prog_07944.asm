; DESCRIPTION: Renders a orange line between points (293, 221) and (451, 224).
; PLAN: r0=293(x1), r1=221(y1), r2=451(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 221
LDI r2, 451
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
