; DESCRIPTION: Renders a orange line between points (40, 63) and (178, 51).
; PLAN: r0=40(x1), r1=63(y1), r2=178(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 63
LDI r2, 178
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
