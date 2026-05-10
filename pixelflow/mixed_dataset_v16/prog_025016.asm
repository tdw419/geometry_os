; DESCRIPTION: Renders a white line between points (289, 92) and (30, 21).
; PLAN: r0=289(x1), r1=92(y1), r2=30(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 92
LDI r2, 30
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
