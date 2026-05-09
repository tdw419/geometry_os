; DESCRIPTION: Renders a white line between points (332, 34) and (34, 116).
; PLAN: r0=332(x1), r1=34(y1), r2=34(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 34
LDI r2, 34
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
