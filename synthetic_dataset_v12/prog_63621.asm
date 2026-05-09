; DESCRIPTION: Renders a white line between points (375, 66) and (51, 164).
; PLAN: r0=375(x1), r1=66(y1), r2=51(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 66
LDI r2, 51
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
