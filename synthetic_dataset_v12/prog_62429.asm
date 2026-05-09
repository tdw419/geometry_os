; DESCRIPTION: Renders a white line between points (159, 115) and (59, 66).
; PLAN: r0=159(x1), r1=115(y1), r2=59(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 115
LDI r2, 59
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
