; DESCRIPTION: Renders a orange line between points (111, 78) and (354, 161).
; PLAN: r0=111(x1), r1=78(y1), r2=354(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 78
LDI r2, 354
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
