; DESCRIPTION: Renders a orange line between points (245, 159) and (310, 82).
; PLAN: r0=245(x1), r1=159(y1), r2=310(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 159
LDI r2, 310
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
