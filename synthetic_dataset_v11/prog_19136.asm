; DESCRIPTION: Draws a white line from (200, 110) to (53, 130).
; PLAN: r0=200(x1), r1=110(y1), r2=53(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 110
LDI r2, 53
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
