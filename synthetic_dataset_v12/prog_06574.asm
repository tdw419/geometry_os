; DESCRIPTION: Renders a orange line between points (396, 111) and (183, 53).
; PLAN: r0=396(x1), r1=111(y1), r2=183(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 111
LDI r2, 183
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
