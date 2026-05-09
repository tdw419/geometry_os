; DESCRIPTION: Draws a orange line from (53, 187) to (22, 176).
; PLAN: r0=53(x1), r1=187(y1), r2=22(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 187
LDI r2, 22
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
