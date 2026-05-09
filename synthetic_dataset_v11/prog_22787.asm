; DESCRIPTION: Renders a white line between points (100, 116) and (125, 230).
; PLAN: r0=100(x1), r1=116(y1), r2=125(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 116
LDI r2, 125
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
