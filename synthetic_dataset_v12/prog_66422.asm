; DESCRIPTION: Renders a white line between points (41, 116) and (250, 13).
; PLAN: r0=41(x1), r1=116(y1), r2=250(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 116
LDI r2, 250
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
