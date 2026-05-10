; DESCRIPTION: Renders a orange line between points (47, 142) and (53, 182).
; PLAN: r0=47(x1), r1=142(y1), r2=53(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 142
LDI r2, 53
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
