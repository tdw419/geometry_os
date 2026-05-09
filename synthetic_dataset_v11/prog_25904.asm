; DESCRIPTION: Draws a white line from (31, 139) to (51, 110).
; PLAN: r0=31(x1), r1=139(y1), r2=51(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 139
LDI r2, 51
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
