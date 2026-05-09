; DESCRIPTION: Draws a white line from (227, 30) to (498, 145).
; PLAN: r0=227(x1), r1=30(y1), r2=498(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 30
LDI r2, 498
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
