; DESCRIPTION: Draws a black line from (491, 240) to (17, 244).
; PLAN: r0=491(x1), r1=240(y1), r2=17(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 240
LDI r2, 17
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
