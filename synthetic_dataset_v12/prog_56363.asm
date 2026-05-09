; DESCRIPTION: Draws a blue line from (507, 41) to (476, 0).
; PLAN: r0=507(x1), r1=41(y1), r2=476(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 41
LDI r2, 476
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
