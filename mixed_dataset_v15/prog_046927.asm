; DESCRIPTION: Draws a blue line from (291, 29) to (41, 97).
; PLAN: r0=291(x1), r1=29(y1), r2=41(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 29
LDI r2, 41
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
