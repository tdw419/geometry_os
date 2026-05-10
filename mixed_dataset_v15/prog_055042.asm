; DESCRIPTION: Renders a white line between points (211, 129) and (7, 199).
; PLAN: r0=211(x1), r1=129(y1), r2=7(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 129
LDI r2, 7
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
