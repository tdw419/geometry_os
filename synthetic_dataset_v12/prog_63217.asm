; DESCRIPTION: Renders a white line between points (71, 21) and (85, 62).
; PLAN: r0=71(x1), r1=21(y1), r2=85(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 21
LDI r2, 85
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
