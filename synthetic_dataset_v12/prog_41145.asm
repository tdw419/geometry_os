; DESCRIPTION: Renders a white line between points (165, 134) and (159, 8).
; PLAN: r0=165(x1), r1=134(y1), r2=159(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 134
LDI r2, 159
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
