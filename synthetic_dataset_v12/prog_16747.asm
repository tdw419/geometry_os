; DESCRIPTION: Draws a white line from (233, 19) to (469, 77).
; PLAN: r0=233(x1), r1=19(y1), r2=469(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 19
LDI r2, 469
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
