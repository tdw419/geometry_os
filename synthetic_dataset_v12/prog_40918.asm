; DESCRIPTION: Renders a green line between points (316, 56) and (436, 245).
; PLAN: r0=316(x1), r1=56(y1), r2=436(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 56
LDI r2, 436
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
