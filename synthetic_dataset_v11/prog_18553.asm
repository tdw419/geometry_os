; DESCRIPTION: Draws a orange line from (230, 101) to (248, 28).
; PLAN: r0=230(x1), r1=101(y1), r2=248(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 101
LDI r2, 248
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
