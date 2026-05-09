; DESCRIPTION: Renders a white line between points (116, 17) and (400, 121).
; PLAN: r0=116(x1), r1=17(y1), r2=400(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 17
LDI r2, 400
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
