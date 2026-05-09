; DESCRIPTION: Places a blue line segment connecting (398, 248) to (272, 41).
; PLAN: r0=398(x1), r1=248(y1), r2=272(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 248
LDI r2, 272
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
