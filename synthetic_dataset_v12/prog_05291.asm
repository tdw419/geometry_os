; DESCRIPTION: Draws a white line from (448, 172) to (223, 129).
; PLAN: r0=448(x1), r1=172(y1), r2=223(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 172
LDI r2, 223
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
