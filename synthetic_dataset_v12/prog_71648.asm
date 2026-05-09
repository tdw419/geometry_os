; DESCRIPTION: Draws a orange line from (31, 200) to (393, 129).
; PLAN: r0=31(x1), r1=200(y1), r2=393(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 200
LDI r2, 393
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
