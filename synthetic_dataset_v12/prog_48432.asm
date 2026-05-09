; DESCRIPTION: Draws a white line from (97, 101) to (429, 104).
; PLAN: r0=97(x1), r1=101(y1), r2=429(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 101
LDI r2, 429
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
