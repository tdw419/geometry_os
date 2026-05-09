; DESCRIPTION: Renders a white line between points (109, 224) and (508, 245).
; PLAN: r0=109(x1), r1=224(y1), r2=508(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 224
LDI r2, 508
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
