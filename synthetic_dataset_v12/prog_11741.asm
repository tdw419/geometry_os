; DESCRIPTION: Places a black line segment connecting (491, 0) to (319, 74).
; PLAN: r0=491(x1), r1=0(y1), r2=319(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 0
LDI r2, 319
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
