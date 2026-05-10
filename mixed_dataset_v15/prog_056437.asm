; DESCRIPTION: Renders a white line between points (23, 26) and (51, 38).
; PLAN: r0=23(x1), r1=26(y1), r2=51(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 26
LDI r2, 51
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
