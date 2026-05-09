; DESCRIPTION: Places a black line segment connecting (97, 46) to (507, 184).
; PLAN: r0=97(x1), r1=46(y1), r2=507(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 46
LDI r2, 507
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
