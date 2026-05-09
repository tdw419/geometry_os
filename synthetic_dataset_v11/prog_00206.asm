; DESCRIPTION: Places a black line segment connecting (0, 46) to (157, 54).
; PLAN: r0=0(x1), r1=46(y1), r2=157(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 46
LDI r2, 157
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
