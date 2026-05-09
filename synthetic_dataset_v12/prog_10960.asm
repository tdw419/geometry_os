; DESCRIPTION: Draws a white line from (312, 222) to (471, 45).
; PLAN: r0=312(x1), r1=222(y1), r2=471(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 222
LDI r2, 471
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
