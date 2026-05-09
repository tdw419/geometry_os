; DESCRIPTION: Renders a orange line between points (183, 89) and (346, 94).
; PLAN: r0=183(x1), r1=89(y1), r2=346(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 89
LDI r2, 346
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
