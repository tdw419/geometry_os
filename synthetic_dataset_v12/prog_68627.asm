; DESCRIPTION: Places a black line segment connecting (438, 128) to (273, 40).
; PLAN: r0=438(x1), r1=128(y1), r2=273(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 128
LDI r2, 273
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
