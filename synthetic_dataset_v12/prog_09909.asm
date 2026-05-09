; DESCRIPTION: Draws a white line from (393, 3) to (469, 112).
; PLAN: r0=393(x1), r1=3(y1), r2=469(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 3
LDI r2, 469
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
