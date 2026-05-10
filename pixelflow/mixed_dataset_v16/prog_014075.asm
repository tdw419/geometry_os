; DESCRIPTION: Draws a white line from (498, 201) to (203, 165).
; PLAN: r0=498(x1), r1=201(y1), r2=203(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 201
LDI r2, 203
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
