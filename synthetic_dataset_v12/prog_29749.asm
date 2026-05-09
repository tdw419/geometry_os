; DESCRIPTION: Places a black line segment connecting (261, 15) to (347, 209).
; PLAN: r0=261(x1), r1=15(y1), r2=347(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 15
LDI r2, 347
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
