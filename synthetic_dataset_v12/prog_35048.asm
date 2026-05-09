; DESCRIPTION: Draws a yellow line from (41, 31) to (77, 181).
; PLAN: r0=41(x1), r1=31(y1), r2=77(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 31
LDI r2, 77
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
