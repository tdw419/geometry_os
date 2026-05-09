; DESCRIPTION: Renders a white line between points (478, 18) and (116, 29).
; PLAN: r0=478(x1), r1=18(y1), r2=116(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 18
LDI r2, 116
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
