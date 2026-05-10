; DESCRIPTION: Draws a orange line from (278, 100) to (328, 170).
; PLAN: r0=278(x1), r1=100(y1), r2=328(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 100
LDI r2, 328
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
