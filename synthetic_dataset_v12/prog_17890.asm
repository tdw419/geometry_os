; DESCRIPTION: Renders a orange line between points (29, 4) and (487, 85).
; PLAN: r0=29(x1), r1=4(y1), r2=487(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 4
LDI r2, 487
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
