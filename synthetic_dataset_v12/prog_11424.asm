; DESCRIPTION: Places a red line segment connecting (129, 204) to (123, 122).
; PLAN: r0=129(x1), r1=204(y1), r2=123(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 204
LDI r2, 123
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
