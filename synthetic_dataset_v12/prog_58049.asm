; DESCRIPTION: Renders a orange line between points (176, 51) and (290, 129).
; PLAN: r0=176(x1), r1=51(y1), r2=290(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 51
LDI r2, 290
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
