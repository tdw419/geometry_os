; DESCRIPTION: Renders a orange line between points (496, 132) and (111, 29).
; PLAN: r0=496(x1), r1=132(y1), r2=111(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 132
LDI r2, 111
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
