; DESCRIPTION: Renders a white line between points (88, 53) and (204, 98).
; PLAN: r0=88(x1), r1=53(y1), r2=204(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 53
LDI r2, 204
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
