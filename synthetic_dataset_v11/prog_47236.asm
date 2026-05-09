; DESCRIPTION: Places a black line segment connecting (232, 143) to (242, 244).
; PLAN: r0=232(x1), r1=143(y1), r2=242(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 143
LDI r2, 242
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
