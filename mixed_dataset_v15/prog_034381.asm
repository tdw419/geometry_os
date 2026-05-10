; DESCRIPTION: Places a black line segment connecting (118, 176) to (264, 254).
; PLAN: r0=118(x1), r1=176(y1), r2=264(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 176
LDI r2, 264
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
