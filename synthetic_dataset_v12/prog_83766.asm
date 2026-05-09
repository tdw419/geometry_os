; DESCRIPTION: Renders a orange line between points (115, 71) and (397, 248).
; PLAN: r0=115(x1), r1=71(y1), r2=397(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 71
LDI r2, 397
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
