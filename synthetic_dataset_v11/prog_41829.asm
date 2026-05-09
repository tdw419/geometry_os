; DESCRIPTION: Renders a white line between points (136, 152) and (51, 241).
; PLAN: r0=136(x1), r1=152(y1), r2=51(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 152
LDI r2, 51
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
