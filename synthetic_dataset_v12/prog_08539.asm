; DESCRIPTION: Renders a orange line between points (205, 57) and (13, 57).
; PLAN: r0=205(x1), r1=57(y1), r2=13(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 57
LDI r2, 13
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
