; DESCRIPTION: Renders a green line segment connecting (241, 7) to (289, 36).
; PLAN: r0=241(x1), r1=7(y1), r2=289(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 7
LDI r2, 289
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
