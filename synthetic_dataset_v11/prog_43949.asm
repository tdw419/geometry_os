; DESCRIPTION: Renders a white line between points (194, 241) and (100, 53).
; PLAN: r0=194(x1), r1=241(y1), r2=100(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 241
LDI r2, 100
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
