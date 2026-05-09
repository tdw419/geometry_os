; DESCRIPTION: Renders a white line between points (76, 45) and (129, 38).
; PLAN: r0=76(x1), r1=45(y1), r2=129(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 45
LDI r2, 129
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
