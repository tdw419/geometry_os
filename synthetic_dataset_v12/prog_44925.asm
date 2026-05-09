; DESCRIPTION: Renders a orange line between points (90, 98) and (117, 123).
; PLAN: r0=90(x1), r1=98(y1), r2=117(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 98
LDI r2, 117
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
