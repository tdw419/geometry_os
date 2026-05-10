; DESCRIPTION: Places a black line segment connecting (444, 240) to (261, 18).
; PLAN: r0=444(x1), r1=240(y1), r2=261(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 240
LDI r2, 261
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
