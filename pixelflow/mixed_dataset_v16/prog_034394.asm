; DESCRIPTION: Renders a white line between points (293, 147) and (107, 47).
; PLAN: r0=293(x1), r1=147(y1), r2=107(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 147
LDI r2, 107
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
