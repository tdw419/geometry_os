; DESCRIPTION: Draws a black line from (27, 233) to (507, 85).
; PLAN: r0=27(x1), r1=233(y1), r2=507(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 233
LDI r2, 507
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
