; DESCRIPTION: Draws a green line from (507, 252) to (447, 155).
; PLAN: r0=507(x1), r1=252(y1), r2=447(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 252
LDI r2, 447
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
