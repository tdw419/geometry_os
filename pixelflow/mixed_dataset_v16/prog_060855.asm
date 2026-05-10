; DESCRIPTION: Renders a orange line between points (76, 213) and (262, 99).
; PLAN: r0=76(x1), r1=213(y1), r2=262(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 213
LDI r2, 262
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
