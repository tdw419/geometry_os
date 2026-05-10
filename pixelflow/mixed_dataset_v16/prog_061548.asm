; DESCRIPTION: Places a black line segment connecting (507, 143) to (271, 98).
; PLAN: r0=507(x1), r1=143(y1), r2=271(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 143
LDI r2, 271
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
