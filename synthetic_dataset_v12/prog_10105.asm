; DESCRIPTION: Renders a white line between points (200, 129) and (100, 194).
; PLAN: r0=200(x1), r1=129(y1), r2=100(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 129
LDI r2, 100
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
