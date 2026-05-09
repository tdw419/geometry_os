; DESCRIPTION: Renders a white line between points (125, 118) and (238, 220).
; PLAN: r0=125(x1), r1=118(y1), r2=238(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 118
LDI r2, 238
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
