; DESCRIPTION: Places a black line segment connecting (478, 246) to (220, 161).
; PLAN: r0=478(x1), r1=246(y1), r2=220(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 246
LDI r2, 220
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
