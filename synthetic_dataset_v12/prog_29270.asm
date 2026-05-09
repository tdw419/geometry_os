; DESCRIPTION: Renders a white line between points (338, 84) and (477, 79).
; PLAN: r0=338(x1), r1=84(y1), r2=477(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 84
LDI r2, 477
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
