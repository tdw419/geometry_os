; DESCRIPTION: Renders a white line between points (234, 199) and (159, 29).
; PLAN: r0=234(x1), r1=199(y1), r2=159(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 199
LDI r2, 159
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
