; DESCRIPTION: Draws a white line from (185, 250) to (469, 43).
; PLAN: r0=185(x1), r1=250(y1), r2=469(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 250
LDI r2, 469
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
