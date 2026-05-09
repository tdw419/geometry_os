; DESCRIPTION: Renders a white line between points (297, 240) and (191, 45).
; PLAN: r0=297(x1), r1=240(y1), r2=191(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 240
LDI r2, 191
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
