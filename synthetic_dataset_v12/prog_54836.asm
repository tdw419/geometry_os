; DESCRIPTION: Renders a white line between points (273, 54) and (51, 107).
; PLAN: r0=273(x1), r1=54(y1), r2=51(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 54
LDI r2, 51
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
