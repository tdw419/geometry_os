; DESCRIPTION: Renders a white line between points (11, 7) and (276, 109).
; PLAN: r0=11(x1), r1=7(y1), r2=276(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 7
LDI r2, 276
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
