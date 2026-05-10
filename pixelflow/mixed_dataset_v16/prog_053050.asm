; DESCRIPTION: Places a green line segment connecting (431, 15) to (296, 189).
; PLAN: r0=431(x1), r1=15(y1), r2=296(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 15
LDI r2, 296
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
