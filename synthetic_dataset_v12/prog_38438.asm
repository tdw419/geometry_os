; DESCRIPTION: Renders a white line between points (78, 104) and (457, 229).
; PLAN: r0=78(x1), r1=104(y1), r2=457(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 104
LDI r2, 457
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
