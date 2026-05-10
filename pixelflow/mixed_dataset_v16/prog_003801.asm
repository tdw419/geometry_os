; DESCRIPTION: Draws a black line from (329, 179) to (507, 212).
; PLAN: r0=329(x1), r1=179(y1), r2=507(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 179
LDI r2, 507
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
