; DESCRIPTION: Draws a orange line from (291, 176) to (347, 121).
; PLAN: r0=291(x1), r1=176(y1), r2=347(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 176
LDI r2, 347
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
