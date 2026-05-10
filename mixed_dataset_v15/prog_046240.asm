; DESCRIPTION: Renders a black line between points (438, 34) and (128, 200).
; PLAN: r0=438(x1), r1=34(y1), r2=128(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 34
LDI r2, 128
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
