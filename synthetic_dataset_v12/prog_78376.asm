; DESCRIPTION: Renders a orange line between points (506, 125) and (388, 65).
; PLAN: r0=506(x1), r1=125(y1), r2=388(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 125
LDI r2, 388
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
