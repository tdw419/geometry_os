; DESCRIPTION: Renders a white line between points (363, 129) and (252, 165).
; PLAN: r0=363(x1), r1=129(y1), r2=252(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 129
LDI r2, 252
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
