; DESCRIPTION: Renders a black line between points (438, 14) and (375, 82).
; PLAN: r0=438(x1), r1=14(y1), r2=375(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 14
LDI r2, 375
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
