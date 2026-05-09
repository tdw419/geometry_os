; DESCRIPTION: Places a black line segment connecting (296, 222) to (503, 68).
; PLAN: r0=296(x1), r1=222(y1), r2=503(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 222
LDI r2, 503
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
