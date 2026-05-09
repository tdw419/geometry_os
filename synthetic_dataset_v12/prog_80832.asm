; DESCRIPTION: Places a blue line segment connecting (309, 175) to (272, 41).
; PLAN: r0=309(x1), r1=175(y1), r2=272(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 175
LDI r2, 272
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
