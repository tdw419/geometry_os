; DESCRIPTION: Places a black line segment connecting (409, 233) to (302, 246).
; PLAN: r0=409(x1), r1=233(y1), r2=302(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 233
LDI r2, 302
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
