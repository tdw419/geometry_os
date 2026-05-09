; DESCRIPTION: Renders a white line between points (183, 35) and (176, 129).
; PLAN: r0=183(x1), r1=35(y1), r2=176(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 35
LDI r2, 176
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
