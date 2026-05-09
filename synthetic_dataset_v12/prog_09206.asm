; DESCRIPTION: Renders a orange line between points (51, 104) and (8, 120).
; PLAN: r0=51(x1), r1=104(y1), r2=8(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 104
LDI r2, 8
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
