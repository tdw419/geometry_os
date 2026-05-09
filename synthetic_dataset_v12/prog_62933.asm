; DESCRIPTION: Renders a white line between points (289, 194) and (441, 109).
; PLAN: r0=289(x1), r1=194(y1), r2=441(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 194
LDI r2, 441
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
