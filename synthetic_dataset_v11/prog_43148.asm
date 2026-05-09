; DESCRIPTION: Draws a white line from (53, 106) to (201, 26).
; PLAN: r0=53(x1), r1=106(y1), r2=201(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 106
LDI r2, 201
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
