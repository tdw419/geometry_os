; DESCRIPTION: Renders a white line between points (289, 240) and (88, 182).
; PLAN: r0=289(x1), r1=240(y1), r2=88(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 240
LDI r2, 88
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
