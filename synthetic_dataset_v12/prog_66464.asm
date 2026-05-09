; DESCRIPTION: Draws a white line from (312, 62) to (498, 227).
; PLAN: r0=312(x1), r1=62(y1), r2=498(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 62
LDI r2, 498
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
