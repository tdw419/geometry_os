; DESCRIPTION: Renders a white line between points (129, 223) and (141, 137).
; PLAN: r0=129(x1), r1=223(y1), r2=141(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 223
LDI r2, 141
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
