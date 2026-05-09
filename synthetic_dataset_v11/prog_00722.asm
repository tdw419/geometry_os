; DESCRIPTION: Renders a white line between points (85, 43) and (130, 77).
; PLAN: r0=85(x1), r1=43(y1), r2=130(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 43
LDI r2, 130
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
