; DESCRIPTION: Renders a orange line between points (487, 105) and (301, 146).
; PLAN: r0=487(x1), r1=105(y1), r2=301(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 105
LDI r2, 301
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
