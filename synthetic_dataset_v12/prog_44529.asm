; DESCRIPTION: Renders a orange line between points (151, 193) and (34, 134).
; PLAN: r0=151(x1), r1=193(y1), r2=34(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 193
LDI r2, 34
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
