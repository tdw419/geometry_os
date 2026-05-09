; DESCRIPTION: Renders a orange line between points (304, 251) and (28, 199).
; PLAN: r0=304(x1), r1=251(y1), r2=28(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 251
LDI r2, 28
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
