; DESCRIPTION: Renders a white line between points (217, 85) and (88, 141).
; PLAN: r0=217(x1), r1=85(y1), r2=88(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 85
LDI r2, 88
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
