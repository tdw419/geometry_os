; DESCRIPTION: Renders a white line between points (47, 236) and (125, 122).
; PLAN: r0=47(x1), r1=236(y1), r2=125(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 236
LDI r2, 125
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
