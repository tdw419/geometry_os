; DESCRIPTION: Renders a white line between points (159, 104) and (177, 173).
; PLAN: r0=159(x1), r1=104(y1), r2=177(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 104
LDI r2, 177
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
