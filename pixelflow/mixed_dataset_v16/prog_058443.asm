; DESCRIPTION: Places a yellow line segment connecting (438, 46) to (53, 79).
; PLAN: r0=438(x1), r1=46(y1), r2=53(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 46
LDI r2, 53
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
