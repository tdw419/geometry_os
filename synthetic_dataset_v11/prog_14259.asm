; DESCRIPTION: Renders a white line between points (56, 238) and (76, 165).
; PLAN: r0=56(x1), r1=238(y1), r2=76(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 238
LDI r2, 76
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
