; DESCRIPTION: Renders a orange line between points (125, 151) and (53, 139).
; PLAN: r0=125(x1), r1=151(y1), r2=53(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 151
LDI r2, 53
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
