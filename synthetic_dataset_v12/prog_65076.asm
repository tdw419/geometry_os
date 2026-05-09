; DESCRIPTION: Renders a white line between points (344, 51) and (350, 245).
; PLAN: r0=344(x1), r1=51(y1), r2=350(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 51
LDI r2, 350
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
