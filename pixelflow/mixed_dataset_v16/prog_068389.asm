; DESCRIPTION: Renders a orange line between points (244, 85) and (275, 48).
; PLAN: r0=244(x1), r1=85(y1), r2=275(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 85
LDI r2, 275
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
