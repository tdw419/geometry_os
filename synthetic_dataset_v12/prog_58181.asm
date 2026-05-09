; DESCRIPTION: Places a black line segment connecting (296, 203) to (372, 212).
; PLAN: r0=296(x1), r1=203(y1), r2=372(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 203
LDI r2, 372
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
