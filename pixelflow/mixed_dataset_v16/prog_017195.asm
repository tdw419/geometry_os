; DESCRIPTION: Renders a white line between points (292, 233) and (289, 88).
; PLAN: r0=292(x1), r1=233(y1), r2=289(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 233
LDI r2, 289
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
