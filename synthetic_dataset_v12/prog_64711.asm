; DESCRIPTION: Renders a white line between points (88, 63) and (289, 122).
; PLAN: r0=88(x1), r1=63(y1), r2=289(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 63
LDI r2, 289
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
