; DESCRIPTION: Renders a magenta line between points (436, 110) and (399, 41).
; PLAN: r0=436(x1), r1=110(y1), r2=399(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 110
LDI r2, 399
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
