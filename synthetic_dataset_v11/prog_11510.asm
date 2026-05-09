; DESCRIPTION: Renders a orange line between points (129, 29) and (164, 57).
; PLAN: r0=129(x1), r1=29(y1), r2=164(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 29
LDI r2, 164
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
