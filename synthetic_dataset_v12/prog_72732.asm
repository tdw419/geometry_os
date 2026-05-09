; DESCRIPTION: Places a black line segment connecting (507, 35) to (262, 52).
; PLAN: r0=507(x1), r1=35(y1), r2=262(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 35
LDI r2, 262
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
