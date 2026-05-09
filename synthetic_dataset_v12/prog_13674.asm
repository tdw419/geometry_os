; DESCRIPTION: Renders a red line between points (9, 129) and (341, 155).
; PLAN: r0=9(x1), r1=129(y1), r2=341(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 129
LDI r2, 341
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
