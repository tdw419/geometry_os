; DESCRIPTION: Renders a white line between points (109, 200) and (172, 12).
; PLAN: r0=109(x1), r1=200(y1), r2=172(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 200
LDI r2, 172
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
