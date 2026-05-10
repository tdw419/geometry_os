; DESCRIPTION: Renders a white line between points (303, 238) and (472, 77).
; PLAN: r0=303(x1), r1=238(y1), r2=472(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 238
LDI r2, 472
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
