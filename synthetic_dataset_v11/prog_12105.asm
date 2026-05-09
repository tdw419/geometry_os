; DESCRIPTION: Draws a blue line from (99, 176) to (41, 118).
; PLAN: r0=99(x1), r1=176(y1), r2=41(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 176
LDI r2, 41
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
