; DESCRIPTION: Renders a yellow line between points (438, 46) and (431, 233).
; PLAN: r0=438(x1), r1=46(y1), r2=431(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 46
LDI r2, 431
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
