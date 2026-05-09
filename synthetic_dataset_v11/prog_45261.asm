; DESCRIPTION: Draws a white line from (17, 201) to (72, 60).
; PLAN: r0=17(x1), r1=201(y1), r2=72(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 201
LDI r2, 72
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
