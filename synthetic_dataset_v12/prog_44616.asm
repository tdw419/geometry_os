; DESCRIPTION: Renders a white line between points (125, 238) and (118, 16).
; PLAN: r0=125(x1), r1=238(y1), r2=118(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 238
LDI r2, 118
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
