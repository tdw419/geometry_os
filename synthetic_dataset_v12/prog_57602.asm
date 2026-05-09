; DESCRIPTION: Draws a white line from (318, 61) to (469, 217).
; PLAN: r0=318(x1), r1=61(y1), r2=469(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 61
LDI r2, 469
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
