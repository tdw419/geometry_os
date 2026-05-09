; DESCRIPTION: Renders a orange line between points (8, 248) and (452, 39).
; PLAN: r0=8(x1), r1=248(y1), r2=452(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 248
LDI r2, 452
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
