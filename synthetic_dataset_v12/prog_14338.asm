; DESCRIPTION: Renders a orange line between points (188, 56) and (354, 98).
; PLAN: r0=188(x1), r1=56(y1), r2=354(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 56
LDI r2, 354
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
