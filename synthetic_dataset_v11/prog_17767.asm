; DESCRIPTION: Renders a white line between points (190, 137) and (85, 187).
; PLAN: r0=190(x1), r1=137(y1), r2=85(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 137
LDI r2, 85
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
