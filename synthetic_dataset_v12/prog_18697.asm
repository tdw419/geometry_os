; DESCRIPTION: Places a black line segment connecting (296, 214) to (353, 44).
; PLAN: r0=296(x1), r1=214(y1), r2=353(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 214
LDI r2, 353
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
