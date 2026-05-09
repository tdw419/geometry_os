; DESCRIPTION: Renders a white line between points (100, 161) and (71, 130).
; PLAN: r0=100(x1), r1=161(y1), r2=71(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 161
LDI r2, 71
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
