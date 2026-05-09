; DESCRIPTION: Renders a white line between points (183, 184) and (40, 142).
; PLAN: r0=183(x1), r1=184(y1), r2=40(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 184
LDI r2, 40
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
