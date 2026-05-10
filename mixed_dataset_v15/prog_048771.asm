; DESCRIPTION: Draws a orange line from (245, 136) to (394, 106).
; PLAN: r0=245(x1), r1=136(y1), r2=394(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 136
LDI r2, 394
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
