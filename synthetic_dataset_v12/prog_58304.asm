; DESCRIPTION: Renders a white line between points (375, 26) and (458, 109).
; PLAN: r0=375(x1), r1=26(y1), r2=458(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 26
LDI r2, 458
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
