; DESCRIPTION: Places a black line segment connecting (240, 84) to (107, 123).
; PLAN: r0=240(x1), r1=84(y1), r2=107(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 84
LDI r2, 107
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
