; DESCRIPTION: Renders a orange line between points (361, 232) and (367, 222).
; PLAN: r0=361(x1), r1=232(y1), r2=367(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 232
LDI r2, 367
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
