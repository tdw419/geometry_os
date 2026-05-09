; DESCRIPTION: Draws a black line from (507, 50) to (314, 148).
; PLAN: r0=507(x1), r1=50(y1), r2=314(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 50
LDI r2, 314
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
