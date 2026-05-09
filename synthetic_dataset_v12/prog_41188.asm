; DESCRIPTION: Renders a orange line between points (337, 248) and (125, 99).
; PLAN: r0=337(x1), r1=248(y1), r2=125(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 248
LDI r2, 125
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
