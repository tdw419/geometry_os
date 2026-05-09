; DESCRIPTION: Renders a orange line between points (163, 61) and (180, 176).
; PLAN: r0=163(x1), r1=61(y1), r2=180(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 61
LDI r2, 180
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
