; DESCRIPTION: Renders a white line between points (179, 110) and (129, 253).
; PLAN: r0=179(x1), r1=110(y1), r2=129(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 110
LDI r2, 129
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
