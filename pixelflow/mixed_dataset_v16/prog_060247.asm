; DESCRIPTION: Renders a orange line between points (491, 82) and (106, 196).
; PLAN: r0=491(x1), r1=82(y1), r2=106(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 82
LDI r2, 106
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
