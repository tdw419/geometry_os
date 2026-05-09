; DESCRIPTION: Places a black line segment connecting (84, 225) to (332, 246).
; PLAN: r0=84(x1), r1=225(y1), r2=332(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 225
LDI r2, 332
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
