; DESCRIPTION: Renders a white line between points (210, 51) and (276, 17).
; PLAN: r0=210(x1), r1=51(y1), r2=276(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 51
LDI r2, 276
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
