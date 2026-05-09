; DESCRIPTION: Draws a white line from (334, 241) to (332, 181).
; PLAN: r0=334(x1), r1=241(y1), r2=332(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 241
LDI r2, 332
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
