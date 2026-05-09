; DESCRIPTION: Draws a white line from (172, 45) to (142, 191).
; PLAN: r0=172(x1), r1=45(y1), r2=142(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 45
LDI r2, 142
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
