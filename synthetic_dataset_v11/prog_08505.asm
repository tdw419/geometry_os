; DESCRIPTION: Renders a orange line between points (166, 51) and (78, 29).
; PLAN: r0=166(x1), r1=51(y1), r2=78(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 51
LDI r2, 78
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
