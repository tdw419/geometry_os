; DESCRIPTION: Draws a white line from (121, 148) to (97, 56).
; PLAN: r0=121(x1), r1=148(y1), r2=97(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 148
LDI r2, 97
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
