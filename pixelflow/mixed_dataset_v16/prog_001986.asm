; DESCRIPTION: Renders a white line between points (153, 142) and (136, 214).
; PLAN: r0=153(x1), r1=142(y1), r2=136(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 142
LDI r2, 136
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
